# Skapa en Backup Vault (förvaringsplats)
resource "aws_backup_vault" "main_vault" {
  name = "my-backup-vault"
}

# Skapa en Plan (När ska backup tas?)
resource "aws_backup_plan" "daily_backup" {
  name = "daily-snapshot-plan"

  rule {
    rule_name         = "daily-rule"
    target_vault_name = aws_backup_vault.main_vault.name
    schedule          = "cron(0 12 * * ? *)" # Varje dag kl 12:00

    lifecycle {
      delete_after = 7 # Spara i 7 dagar
    }
  }
}
