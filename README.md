# Linux-Security-Hardening
Automated security hardening for Ubuntu/Debian servers

# Linux Security Hardening

## Overzicht
Dit project bevat twee bash-scripts om een Ubuntu/Debian server snel en consistent te hardenen.  
Ik gebruik dit om basis Linux-beheer en security hardening te oefenen.

## Wat het script doet
`harden-server.sh`:
1. Installeert updates en zet automatische security-updates aan  
2. Verbetert SSH-beveiliging (geen root-login, geen wachtwoordlogin, andere poort)  
3. Configureert UFW firewall (alles dicht behalve SSH/HTTP/HTTPS)  
4. Installeert auditd voor security logging  
5. Start een eenvoudige security-audit

`security-audit.sh`:
- Laat SUID-bestanden zien  
- Controleert SSH-configuratie  
- Toont firewallstatus  
- Laat mislukte SSH-logins zien  
- Toont pakketten met updates

## Hoe je het gebruikt
chmod +x harden-server.sh security-audit.sh
sudo ./harden-server.sh



## Skills die ik hiermee oefen
- Linux systeembeheer (Ubuntu/Debian)
- Bash-scripting
- Security hardening (SSH, firewall, logging)
- Basis monitoring en auditing
