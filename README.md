# Ybaka

Ybaka (Tupi: "céu") é o site público do [Tainá](https://github.com/taina-labs/taina):
a nuvem privada e auto-hospedada de uma comunidade. É o céu onde a estrela da
manhã aparece, a porta de entrada de quem quer entender e instalar o projeto.

Site estático, sem framework, sem build e sem dependência. HTML e CSS puros,
com um fio de JavaScript só para o que o HTML não faz sozinho (copiar blocos de
comando e alternar abas).

## Páginas

| Rota | O que é |
| --- | --- |
| `index.html` | Landing: o que é o Tainá, os nomes, como funciona, comparação, o futuro, instalação rápida, FAQ |
| `instalar.html` | Guia de instalação passo a passo (máquina própria ou VPS) |
| `transparencia.html` | Honestidade e LGPD: o que existe, o que falta, o que não prometemos |
| `glossario.html` | Os termos técnicos, um por linha |

## Rodar localmente

Como é estático, qualquer servidor de arquivos serve:

```sh
python3 -m http.server 8080
```

Depois abra `http://localhost:8080`. Não precisa de Node nem de instalar nada.

## Design tokens

`styles/tokens.css` é **vendorizado** do repositório do Tainá e é a única fonte
de verdade visual: cores, tipografia, espaçamento e raios vêm todos de lá. Não
edite esse arquivo à mão. Para sincronizar com a fonte:

```sh
./scripts/sync-tokens.sh          # baixa de github.com/taina-labs/taina
TAINA_TOKENS_SRC=../taina/assets/css/tokens.css ./scripts/sync-tokens.sh
```

O CI confere, a cada push, que o arquivo vendorizado continua igual ao do Tainá.

## Princípios

- **pt-BR primeiro e único.** Nada de inglês vazando para a interface.
- **Mobile-first**, um breakpoint só (768px). Toque de 44px, foco visível,
  `prefers-reduced-motion` respeitado.
- **Zero terceiros.** Sem cookies, sem rastreio, sem CDN. As fontes
  (Bricolage Grotesque, Schibsted Grotesk, JetBrains Mono) são auto-hospedadas
  em `fonts/`.
- **Honestidade como feature.** Sem prometer criptografia, sem dizer que é
  100% LGPD. O status alfa fica à vista.
- **Só tokens semânticos.** Nenhum valor bruto (hex, px solto) em componente.

O tom de voz e o vocabulário seguem o
[`tom-de-voz.md`](https://github.com/taina-labs/tekoa/blob/main/branding/tom-de-voz.md)
e a convenção de nomes da
[RFC 003](https://github.com/taina-labs/tekoa/blob/main/tecnico/RFC_003_GOVERNANCA_E_TRANSPARENCIA.md).

## Estrutura

```
index.html            landing
instalar.html         guia de instalação
transparencia.html    transparência e LGPD
glossario.html        termos técnicos, um por linha
styles/
  tokens.css          design tokens (vendorizado do Tainá)
  base.css            fontes, reset, estilos de tipo
  ybaka.css           componentes e layout do site
fonts/                fontes variáveis auto-hospedadas (woff2)
js/app.js             abas e botão de copiar
scripts/sync-tokens.sh
```

## Publicar

Site estático: publique com GitHub Pages, Cloudflare Pages ou qualquer host de
arquivos, apontando para a raiz do repositório. Nenhuma configuração de build.

## Licença

[GNU AGPL v3.0](LICENSE), a mesma do Tainá.
