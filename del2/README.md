
# Kom igang med dbt-utvikling
Den enkleste måten å sette opp et utviklingsmiljø for dbt på, er med Google Cloud Shell.
Google Cloud Shell finner du [her](https://console.cloud.google.com/home/dashboard?cloudshell=true).
Dette vil åpne et terminalvindu nederst på siden.

![Cloud Shell](readme-files/cloud-shell.png)

## Førstegangsoppsett
For å sette opp miljøet første gang, må du gjøre følgende kommandoer:
### Installere github-klient (gh)
Dette installerer en github-klient og logger deg inn på github.

```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
gh auth login
```
Velg alle standard-alternativene som `gh auth login` foreslår (Github.com, HTTPS, Login with web browser).

### Konfigurere git
Sett opp git til å bruke ditt navn og e-postadresse.

```bash
git config --global user.email you@bekk.no
git config --global user.name YourName
```

### Klone repo
Nå kan du klone dette Github-repoet:

```bash
git clone https://github.com/bekk/oppdrift-data-analyse
```

## Utvikling
I Cloud Shell kan du trykke Open Editor for å åpne en IDE for å utvikle.

![Open Editor](readme-files/open-editor.png)

Velg `File -> Open workspace` for å åpne repoet ditt som et workspace.

## Installere dbt
Først må vi installere `dbt` i ditt Cloud Shell.

Vi må først oppgradere setuptools, og deretter installere `dbt-bigquery`:
```bash
pip3 install --upgrade setuptools
pip3 install dbt-bigquery
```

Lag `~/.dbt/profiles.yml` med følgende innhold:
```
oppdrift_dbt:
  outputs:
    dev:
      dataset: dbt_<brukernavn>
      fixed_retries: 1
      location: EU
      method: oauth
      priority: interactive
      project: oppdrift-369209
      threads: 4
      timeout_seconds: 300
      type: bigquery
  target: dev
```

## dbt på codespaces
Åpne Github, trykk grønn Code-knapp, velg Codespaces og Create new.

pip install dbt-bigquery
./create_profiles.py <brukernavn>

./install_gcloud.sh

~/google-cloud-sdk/bin/gcloud init
Si ja til innlogging
Åpne URL-en, logg inn, kopier koden nederst
Velg oppdrift som prosjekt

~/google-cloud-sdk/bin/gcloud auth login --update-adc
Åpne URL-en, logg inn, kopier koden nederst



# Oppgaver

## Deduplisering

## 