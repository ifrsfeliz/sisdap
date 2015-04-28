# solpa-rails
Sistema de Licitatório, Orçamentário e de Planejamento Administrativo



# Dependencias

WKHTMLTOPDF (TER CERTEZA DE TER SIDO COMPILADO COM QT PACHED, CASO CONTRÁRIO OS RODAPÉS E CABEÇALHOS NÂO FUNCIONARÂO)

In Ubuntu 14.04, open the terminal and type:

```sudo add-apt-repository ppa:ecometrica/servers```
```sudo apt-get update```
```sudo apt-get install wkhtmltopdf```

In Ubuntu 12.04, open the terminal and type:

```sudo add-apt-repository ppa:pov/wkhtmltopdf```
```sudo apt-get update```
```sudo apt-get install wkhtmltopdf```

Maneira de testar: ```wkhtmltopdf --default-header http://google.com.br teste.pdf```
