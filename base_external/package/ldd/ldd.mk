LDD_VERSION = 9afdfc07162ac9a78a3b20123552b627053d8998
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-Amogh-Sadhu.git
LDD_SITE_METHOD = git

LDD_MODULE_SUBDIRS = misc-modules scull

$(eval $(kernel-module))
$(eval $(generic-package))

define LDD_INSTALL_TARGET_CMDS
	# Install the kernel modules (.ko files)
	$(INSTALL) -m 0755 -D $(@D)/scull/scull.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/scull.ko
	$(INSTALL) -m 0755 -D $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/faulty.ko

	# Install the LOAD/UNLOAD scripts to /usr/bin so the S98 script can find them
	$(INSTALL) -m 0755 -D $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/scull_load
	$(INSTALL) -m 0755 -D $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/scull_unload
	$(INSTALL) -m 0755 -D $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/module_load
	$(INSTALL) -m 0755 -D $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/module_unload
endef

