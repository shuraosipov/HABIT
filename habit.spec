Name:           habit
Version:        1.0.0
Release:        1%{?dist}
Summary:        HAndy Bash system Information Tool

Group:          Applications/System
License:        GPLv2+
URL:            https://github.com/shuraosipov/habit
Source0:        %{name}-%{version}.tar.gz

BuildRequires:  daemonize


%description
System monitoring script in Bash which displays information in an appropriate/handy way


%prep
%setup -q


%build
%install
mkdir -p $RPM_BUILD_ROOT/etc/habit
mkdir -p $RPM_BUILD_ROOT/etc/habit/conf
mkdir -p $RPM_BUILD_ROOT/usr/bin



install -m 0755 -d  $RPM_BUILD_ROOT/usr/bin/
install -m 0755 habit $RPM_BUILD_ROOT/usr/bin/habit
install -m 0755 -d $RPM_BUILD_ROOT/etc/habit
install -m 0755 -d $RPM_BUILD_ROOT/etc/habit/conf
install -m 0755 conf/* $RPM_BUILD_ROOT/etc/habit/conf/



%files
%defattr(0755, root,root)
%dir /etc/habit
%dir /etc/habit/conf
/etc/habit/conf/*
/usr/bin/habit

%post
install -m 0755 -d /var/log/habit
install -m 0755 -d /var/log/habit/oscap

