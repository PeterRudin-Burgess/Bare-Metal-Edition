### d100 Open-Ended Roleplaying -- Bare Metal Edition

To regenerate the documents, type on the command line:

```
./mvnw clean package
./xbin/pml2pdf.sh --cli src/main/pml/main.pml dist/main.pdf
```

dist/main.pdf will contain the final document