---
draft: true
title: "Bluetooth"
date: 2024-02-21T22:50:00-03:00
description: "Tentativas de entender o que está acontecendo com meu fone"
draft: true
---

- Ele fica anunciando o LE (low energy) Independente se eu tô ou não conectado nele
- No scan ele responde como "EDIFIER BLE"
- O advertising vem com a flag dizendo que não suporta conexão BR/EDR (Base Rate/Enhanced Data Rate) ao mesmo tempo
- Ok, acho que eu fui burro e deixar o menu bluetooth do gnome aberto mantém o scan ligado

Quando eu mudo o codec, ele dá:

```
606 3.242819 host       controller HCI_CMD 21 Sent Setup Synchronous Connection
607 3.249527 controller host       HCI_EVT 7  Rcvd Command Status (Setup Synchronous Connection)
608 3.251523 controller host       HCI_EVT 20 Rcvd Synchronous Connection Complete (Status: Success (0x00))
```

e depois não tem nenhum pacote... tô pensando se não é meu PC que não tá sabendo codificar o áudio? Talvez nem seja isso, já que o fone teria que estar enviando áudio pelo microfone, e o wireshark estaria pegando esse caso...

pelo que li em https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/1827 é um problema mais embaixo na stack do bluetooth, o que faz algum sentido.

Vamos lá, testando o kernel 6.1... Não foi.

No final, fui ver os reviews na Amazon e achei a causa: o desgraçado não funcionou com outras pessoas. Ele deve ter algum erro na implementação de handsfree dele... Pelo menos posso ir dormir agora! São 03:12h, 08 de março de 24
