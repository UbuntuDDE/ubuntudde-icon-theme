PREFIX = /usr

all: check


check: check-same-icon check-perm

check-name-unique:
	find deepin -name "*.svg*" | xargs -n1 basename | sort | uniq -d | xargs -I '{}' find -name '{}'
	find deepin-dark -name "*.svg*" | xargs -n1 basename | sort | uniq -d | xargs -I '{}' find -name '{}'
	find bloom -name "*.svg*" | xargs -n1 basename | sort | uniq -d | xargs -I '{}' find -name '{}'
	find bloom-dark -name "*.svg*" | xargs -n1 basename | sort | uniq -d | xargs -I '{}' find -name '{}'
	find bloom-classic -name "*.svg*" | xargs -n1 basename | sort | uniq -d | xargs -I '{}' find -name '{}'
	find bloom-classic-dark -name "*.svg*" | xargs -n1 basename | sort | uniq -d | xargs -I '{}' find -name '{}'
	find bloom-fantacy -name "*.svg*" | xargs -n1 basename | sort | uniq -d | xargs -I '{}' find -name '{}'
check-same-icon:
	find deepin -type f | xargs md5sum | sort | uniq --check-chars=32 -d
	find deepin-dark -type f | xargs md5sum | sort | uniq --check-chars=32 -d
	find bloom-dark -type f | xargs md5sum | sort | uniq --check-chars=32 -d
	find bloom -type f | xargs md5sum | sort | uniq --check-chars=32 -d
	find bloom-classic -type f | xargs md5sum | sort | uniq --check-chars=32 -d
	find bloom-classic-dark -type f | xargs md5sum | sort | uniq --check-chars=32 -d
	find bloom-fantacy -type f | xargs md5sum | sort | uniq --check-chars=32 -d
check-perm:
	@echo "Fix icon files permission"
	find deepin -type f -exec chmod 644 {} \;
	find deepin-dark -type f -exec chmod 644 {} \;
	find bloom-dark -type f -exec chmod 644 {} \;
	find bloom -type f -exec chmod 644 {} \;
	find bloom-classic -type f -exec chmod 644 {} \;
	find bloom-classic-dark -type f -exec chmod 644 {} \;
	find bloom-fantacy -type f -exec chmod 644 {} \;

prepare: check-name-unique check-same-icon

build: prepare

clean:
	rm -rf build


install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons/deepin
	cp -r deepin/* $(DESTDIR)$(PREFIX)/share/icons/deepin
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons/deepin-dark
	cp -r deepin-dark/* $(DESTDIR)$(PREFIX)/share/icons/deepin-dark
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons/bloom
	cp -r bloom/* $(DESTDIR)$(PREFIX)/share/icons/bloom
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons/bloom-dark
	cp -r bloom-dark/* $(DESTDIR)$(PREFIX)/share/icons/bloom-dark
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons/bloom-classic
	cp -r bloom-classic/* $(DESTDIR)$(PREFIX)/share/icons/bloom-classic
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons/bloom-classic-dark
	cp -r bloom-classic-dark/* $(DESTDIR)$(PREFIX)/share/icons/bloom-classic-dark
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons/bloom-fantacy
	cp -r bloom-fantacy/* $(DESTDIR)$(PREFIX)/share/icons/bloom-fantacy
