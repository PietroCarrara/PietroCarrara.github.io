---
title: "Julia Test!"
date: 2021-08-23T14:25:23-03:00
---

{{< julia plot="images/sin-cos.png" >}}
using Plots

f(x) = sin(x) + -cos(3x)
plot(f, 1:0.01:10)
{{< /julia >}}

{{< figure "images/sin-cos.png" >}}
    This figure is actually rendered by hugo, using the julia C bindings.
{{< /figure >}}
