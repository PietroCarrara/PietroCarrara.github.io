---
date: "2020-08-25T00:00:00Z"
title: Drivers do Huion HS64
tags:
  - huion
  - tech
  - linux
---

Devido a pandemia em curso do COVID-19, eu me encontrei com tempo livre demais; tanto que eu decidi experimentar um novo hobby: Desenhar. Eu não pretendo levar isso a sério, eu só queria rabiscar alguma coisa enquanto eu não tenho nada melhor pra fazer.

Então eu decidi pegar emprestado uma mesa digitalizadora de uma amiga que tinha uma Wacom. Era uma ferramenta bem legal. Só pluguei e tudo funcionou *out of the box*. Eu até consegui jogar um pouco de osu! usando ela.

Eu devolvi ela depois de umas 2~3 semanas, e decidi que eu deveria comprar uma. Eu fiz uma pequena pesquisa, e os dispositivos da Huion tinham os preços mais baixos; já que eu não vou levar a sério esse hobby, eu escolhi o modelo HS64.

Quando ele chegou aqui, o tablet não era *plug-n-play*, mas foi só instalar os drivers [digimend](https://github.com/DIGImend/digimend-kernel-drivers) que ele funcionou. Pelo menos parcialmente.

Duas coisas não funcionaram:

- As *Wacom tools* não reconheceram o dispositivo, então configurar coisas como uma área ativa não eram possíveis (pelo menos não de uma maneira simples).
- Apesar de poder usar os 2 botões na caneta, os 4 botões do tablet não eram reconhecidos.

Foi aí que eu me lembrei desse [vídeo](https://www.youtube.com/watch?v=juGNPLdjLH4), que tem algumas dicas pra começar a brincar com desenvolvimento de kernel a partir da programação de drivers. E isso me deu uma ideia.

Assim que pensei nisso, já estava clonando o repositório do Digimend e tentando entender o projeto.

O README do projeto é muito bom. Tão bom que eu consegui resolver meus problemas só de ler ele. Nele há um guia de como configurar o Xorg para funcionar usando o driver da Wacom; depois de seguir o passo-a-passo, tudo passou a funcionar: eu conseguia usar as *Wacom tools* e os botões do tablet estavam funcionando.

Depois eu descobri que o verdadeiro culpado era o [pacote do AUR](https://aur.archlinux.org/packages/digimend-kernel-drivers-dkms-git) que eu estava usando não fazia essa configuração. Então, ao invés de sujar as minhas mãos com código de drivers, eu me contentei por escrever um [novo pacote](https://aur.archlinux.org/packages/digimend-drivers-git-dkms).

Quem sabe na próxima eu não dou a sorte de comprar um aparelho com um driver quebrado...