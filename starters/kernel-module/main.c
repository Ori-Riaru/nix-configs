#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Your Name");
MODULE_DESCRIPTION("A simple hello world kernel module");

static int __init hello_init(void) {
  printk(KERN_INFO "hello world!\n");
  return 0;
}

static void __exit hello_cleanup(void) { printk(KERN_INFO "bye world!\n"); }

module_init(hello_init);
module_exit(hello_cleanup);