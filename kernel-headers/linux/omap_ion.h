/****************************************************************************
 ****************************************************************************
 ***
 ***   This header was automatically generated from a Linux kernel header
 ***   of the same name, to make information necessary for userspace to
 ***   call into the kernel available to libc.  It contains only constants,
 ***   structures, and macros generated from the original header, and thus,
 ***   contains no copyrightable information.
 ***
 ***   To edit the content of this header, modify the corresponding
 ***   source file (e.g. under external/kernel-headers/original/) then
 ***   run bionic/libc/kernel/tools/update_all.py
 ***
 ***   Any manual change here will be lost the next time this script will
 ***   be run. You've been warned!
 ***
 ****************************************************************************
 ****************************************************************************/
#ifndef _LINUX_OMAP_ION_H
#define _LINUX_OMAP_ION_H
#include <linux/types.h>
struct omap_ion_tiler_alloc_data {
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 size_t w;
 size_t h;
 int fmt;
 unsigned int flags;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 struct ion_handle *handle;
 size_t stride;
 size_t offset;
 uint32_t out_align;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 uint32_t token;
};
struct omap_ion_phys_addr_data {
 struct ion_handle *handle;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 unsigned long phys_addr;
 size_t size;
};
enum {
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 OMAP_ION_HEAP_SYSTEM = ION_HEAP_TYPE_CUSTOM + 1,
 OMAP_ION_HEAP_SECURE_INPUT,
 OMAP_ION_HEAP_TILER,
 OMAP_ION_HEAP_NONSECURE_TILER,
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 OMAP_ION_HEAP_TILER_RESERVATION,
};
#define OMAP_ION_HEAP_TILER_MASK (1 << OMAP_ION_HEAP_TILER)
#define OMAP_ION_HEAP_NONSECURE_TILER_MASK (1 << OMAP_ION_HEAP_NONSECURE_TILER)
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#define OMAP_ION_HEAP_TILER_RESERVATION_MASK (1 << OMAP_ION_HEAP_TILER_RESERVATION)
enum {
 OMAP_ION_TILER_ALLOC,
 OMAP_ION_PHYS_ADDR,
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
};
enum {
 TILER_PIXEL_FMT_MIN = 0,
 TILER_PIXEL_FMT_8BIT = 0,
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 TILER_PIXEL_FMT_16BIT = 1,
 TILER_PIXEL_FMT_32BIT = 2,
 TILER_PIXEL_FMT_PAGE = 3,
 TILER_PIXEL_FMT_MAX = 3
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
};
#endif
