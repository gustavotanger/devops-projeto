# CI/CD Pipeline com GitHub Actions (Python + Docker)

Projeto de estudo focado em construir e entender, na prática, um pipeline de CI/CD completo: testes automatizados, build de imagem Docker e execução condicionada ao sucesso dos testes.

## O que o pipeline faz

A cada `push` ou `pull request` na branch `main` (ou `feature-inicial`), o GitHub Actions executa dois jobs em sequência:

1. **build** — instala as dependências (`requirements.txt`) e roda a suíte de testes com `pytest`.
2. **docker** — só executa se o job `build` passar (`needs: build`); constrói a imagem Docker da aplicação.

Esse encadeamento (testes antes do build) é o mesmo princípio usado em pipelines de produção: nunca empacotar/publicar código sem antes provar, via teste automatizado, que ele funciona.

## Estrutura

- `app.py` — ponto de entrada da aplicação.
- `app_logic.py` — funções de exemplo (soma, verificação de par/ímpar, inversão de string, capitalização, divisão) usadas para exercitar o pipeline de testes.
- `tests/test_app_logic.py` — suíte de testes unitários (`pytest`) cobrindo cada função, incluindo o caso de exceção (`ZeroDivisionError`).
- `Dockerfile` — containeriza a aplicação a partir de `python:3.9-slim`.
- `.github/workflows/ci-cd.yml` — definição do pipeline (job `build` + job `docker`).

## Rodando localmente

```bash
pip install -r requirements.txt
PYTHONPATH=. pytest -q

docker build -t devops-projeto .
docker run devops-projeto
```

## O que esse projeto demonstra

- Configuração de pipeline de CI/CD do zero com GitHub Actions.
- Testes automatizados como gate obrigatório antes de qualquer build/deploy.
- Containerização com Docker.
- Boas práticas de controle de versão (`.gitignore` ajustado para não versionar artefatos desnecessários).

## Autor

Gustavo Tangerino — [LinkedIn](https://www.linkedin.com/in/gustavo-tanger/)
