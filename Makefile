PORTNAME=	ansible-init-firstboot
PORTVERSION=	1.0
CATEGORIES=	sysutils
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	vbotka@gmail.com
COMMENT=	Firstboot ansible-pull initialization rc script

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${FILESDIR}/LICENSE

RUN_DEPENDS=	ansible:sysutils/ansible

NO_ARCH=	yes
NO_BUILD=	yes

USE_RC_SUBR=	ansible_init
SUB_FILES=	ansible_init.8
PLIST_FILES=	share/man/man8/ansible_init.8.gz \
		share/ansible_init/ansible.cfg.sample \
		share/ansible_init/hosts.sample \
		share/ansible_init/pb-example.yml.sample \
		share/ansible_init/README

do-install:
	${INSTALL_MAN} ${WRKDIR}/ansible_init.8 ${STAGEDIR}${PREFIX}/share/man/man8/
	${MKDIR} ${STAGEDIR}${PREFIX}/share/ansible_init
	${INSTALL_DATA} ${FILESDIR}/examples/ansible.cfg.sample ${STAGEDIR}${PREFIX}/share/ansible_init/
	${INSTALL_DATA} ${FILESDIR}/examples/hosts.sample ${STAGEDIR}${PREFIX}/share/ansible_init/
	${INSTALL_DATA} ${FILESDIR}/examples/pb-example.yml.sample ${STAGEDIR}${PREFIX}/share/ansible_init/
	${INSTALL_DATA} ${FILESDIR}/examples/README ${STAGEDIR}${PREFIX}/share/ansible_init/

.include <bsd.port.mk>
