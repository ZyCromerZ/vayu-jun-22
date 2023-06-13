// SPDX-License-Identifier: GPL-2.0

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/moduleparam.h>
#include <linux/miscdevice.h>

unsigned int minor_window_app;
module_param(minor_window_app, uint, 0644);
static unsigned int perf_mod = 1;
module_param(perf_mod, uint, 0644);
static unsigned int first_lunch_fps = 100;
module_param(first_lunch_fps, uint, 0644);
static unsigned int ceiling_slack_ms = MSEC_PER_SEC;
module_param(ceiling_slack_ms, uint, 0644);
static unsigned int ceiling_from_user;
module_param(ceiling_from_user, uint, 0644);
static unsigned int high_resolution_enable = 1;
module_param(high_resolution_enable, uint, 0644);
static unsigned int migt_debug;
module_param(migt_debug, uint, 0644);
static unsigned int migt_ms = 50;
module_param(migt_ms, uint, 0644);
static unsigned int migt_thresh = 18;
module_param(migt_thresh, uint, 0644);
static unsigned int itask_detect_interval = 5000;
module_param(itask_detect_interval, uint, 0644);
static unsigned int over_thresh_count;
module_param(over_thresh_count, uint, 0644);
static unsigned int boost_policy;
module_param(boost_policy, uint, 0644);
static unsigned int cpu_boost_cycle = 10;
module_param(cpu_boost_cycle, uint, 0644);
static unsigned int render_update = 1;
module_param(render_update, uint, 0644);
static unsigned int fas_power_mod;
module_param(fas_power_mod, uint, 0644);

static int set_migt_freq(const char *buf, const struct kernel_param *kp)
{
	return 0;
}

static int get_migt_freq(char *buf, const struct kernel_param *kp)
{
	return 0;
}

static const struct kernel_param_ops param_ops_migt_freq = {
	.set = set_migt_freq,
	.get = get_migt_freq,
};

module_param_cb(mi_viptask, &param_ops_migt_freq, NULL, 0644);
module_param_cb(migt_freq, &param_ops_migt_freq, NULL, 0644);
module_param_cb(smart_ceiling_freq, &param_ops_migt_freq, NULL, 0644);
module_param_cb(add_lclus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);
module_param_cb(add_mclus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);
module_param_cb(add_bclus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);
module_param_cb(reset_clus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);
module_param_cb(del_lclus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);
module_param_cb(del_mclus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);
module_param_cb(del_bclus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);
module_param_cb(show_lclus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);
module_param_cb(show_mclus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);
module_param_cb(show_bclus_affinity_uidlist, &param_ops_migt_freq,NULL, 0644);

static int migt_open(struct inode *inode, struct file *file)
{
	return 0;
}

static int migt_release(struct inode *ignored, struct file *file)
{
	return 0;
}

static int migt_mmap(struct file *file, struct vm_area_struct *vma)
{
	return 0;
}

static long migt_ioctl(struct file *fp, unsigned int cmd,
				 unsigned long arg)
{
	return 0;
}

static const struct file_operations migt_fops = {
	.owner = THIS_MODULE,
	.open = migt_open,
	.release = migt_release,
	.mmap = migt_mmap,
	.unlocked_ioctl = migt_ioctl,
};

static struct miscdevice migt_misc = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = "migt",
	.fops = &migt_fops,
};

static int migt_init(void)
{
	misc_register(&migt_misc);
	return 0;
}

late_initcall(migt_init);
