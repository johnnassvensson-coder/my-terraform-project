# Terraform AWS Project
Detta projekt sätter upp en webbserver med automatisk daglig backup.

## Hur man kör lokalt
1. Kör `terraform init`
2. Kör `terraform plan` för att se ändringar.
3. Kör `terraform apply` för att bygga.

## Pipeline
GitHub Actions sköter deployment automatiskt vid push till main.
