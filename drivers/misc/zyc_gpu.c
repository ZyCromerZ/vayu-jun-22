/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * Copyright (C) 2023 ZyCromerZ
 *
 * Inspired from lyb gpu
 *
 */

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <misc/zyc_gpu.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("ZyCromerZ");
MODULE_DESCRIPTION("zyc gpu");
MODULE_VERSION("0.0.1");

unsigned int __read_mostly kgsl_old_check_gpuaddr = 1;
module_param(kgsl_old_check_gpuaddr, uint, 0644);

unsigned int __read_mostly kgsl_old_close = 1;
module_param(kgsl_old_close, uint, 0644);

unsigned int __read_mostly kgsl_thermal_limit = 0;
module_param(kgsl_thermal_limit, uint, 0644);

static int __init prepare_driver_init(void) {
 printk(KERN_INFO "zyc gpu initialized");
 return 0;
}
static void __exit prepare_driver_exit(void) {
 printk(KERN_INFO "zyc gpu exit");
}

module_init(prepare_driver_init);
module_exit(prepare_driver_exit);
