
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
Github codespaces gir deg en virtuell maskin der du kan utvikle i VS code og kjøre kode, f.eks. Python og dbt.

### Lage codespace
For å lage et codespace, åpne repoet `oppdrift-data-analyse` på Github, trykk grønn Code-knapp, velg Codespaces og Create new.
Åpne terminalen i ditt codespace og kjør følgende kommandoer:

```bash
pip install dbt-bigquery # Installerer dbt
./create_profiles.py <brukernavn> # Oppretter ~/.dbt/profiles.yml for dbt
./install_gcloud.sh # Installerer verktøy for å autentisere mot Google Cloud
```

For å koble deg til Google Cloud:
`~/google-cloud-sdk/bin/gcloud init`
- Si ja til innlogging
- Åpne URL-en, logg inn med din Bekk-bruker, kopier koden nederst tilbake til terminalen.
- Velg oppdrift som prosjekt

For å få token som dbt kan bruke:
`~/google-cloud-sdk/bin/gcloud auth login --update-adc`
Åpne URL-en, logg inn med din Bekk-bruker, kopier koden nederst tilbake til terminalen.

Da er du klar til å begynne med utvikling av dbt-modeller!

# Oppgaver

## Deduplisering

## 