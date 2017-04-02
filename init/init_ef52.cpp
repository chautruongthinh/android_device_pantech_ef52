/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void vendor_load_properties()
{
    char device_buf[PROP_VALUE_MAX];
    FILE *fp;
    int rc, n;

    fp = fopen("/dev/block/platform/msm_sdcc.1/by-name/rawdata", "r");
    if ( fp == NULL )
    {
        INFO("Failed to open info for board version read");
        return;
    }
    else
    {
        fseek(fp,0x24,SEEK_SET);
        n = fread(device_buf, 8, 1, fp);
        device_buf[8] = '\0';
        fclose(fp);
    }

    property_set("ro.product.model", device_buf);

    if (strstr(device_buf, "IM-A870S"))
    {
        property_set("ro.product.device", "ef52s");
    }
    else if (strstr(device_buf, "IM-A870K"))
    {
        property_set("ro.product.device", "ef52k");
    }
    else if (strstr(device_buf, "IM-A870L"))
    {
        property_set("ro.product.device", "ef52l");
    }
    else
        property_set("ro.product.device", "ef52s");
}
