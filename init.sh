#!/bin/bash
[ -f "common/config/main-local.php" ] || {
    cp "common/config/main-local.php.dist" "common/config/main-local.php"
    echo "Arquivo de configuração criado. Por favor edite com seus dados!"
}
