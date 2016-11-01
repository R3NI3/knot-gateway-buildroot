################################################################################
#
#knot-web
#
################################################################################

KNOT_WEB_VERSION = aa6ebf8257c2e3dd37a2a9b4e3947f5cca3ad0f6
KNOT_WEB_SITE_METHOD = git
KNOT_WEB_SITE = https://github.com/CESARBR/knot-gateway-webui.git
KNOT_WEB_DEPENDENCIES = nodejs

define KNOT_WEB_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/local/bin/knot-web*
	mkdir -p $(TARGET_DIR)/usr/local/bin/
	cd $(@D) && $(NPM) install
	cp -R $(@D) $(TARGET_DIR)/usr/local/bin/
endef

define KNOT_WEB_INSTALL_INIT_SCRIPT
	$(INSTALL) -D -m 0777 $(KNOT_WEB_PKGDIR)/knot-web $(TARGET_DIR)/usr/local/bin/
	$(INSTALL) -D -m 0777 $(KNOT_WEB_PKGDIR)/S70knot-web-daemon $(TARGET_DIR)/etc/init.d/
endef

KNOT_WEB_POST_INSTALL_TARGET_HOOKS += KNOT_WEB_INSTALL_INIT_SCRIPT

$(eval $(generic-package))
