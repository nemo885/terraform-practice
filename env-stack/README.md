# env-stack

Два окружения (dev, stage) из одного модуля `app-stack`:
сеть, postgres с healthcheck, nginx-приложение.

## Запуск

Пароль БД задаётся через переменную окружения (PowerShell):

```powershell
$env:TF_VAR_db_password = "your_password"
```

```powershell
tofu workspace select dev
tofu apply -var-file="envs/dev.tfvars"
```

Для stage замени dev на stage.

## State

Для разделения окружений выбраны workspaces: один код и один backend,
у каждого окружения свой state. `destroy` в dev не затрагивает stage.
Образы Docker общие для окружений, поэтому у них `keep_locally = true`.