---
title: "Julia Test!"
date: 2021-08-28T14:25:23-03:00
---

Now I can just write plain Julia code and have it generate results for me:

{{< julia plot="images/sin-cos.png" caption="I can caption the result." >}}
using Plots

f(x) = 0.1sin(x) + -cos(3x)
plot(f, 1:0.01:10)
{{< /julia >}}

Cool, isn't it?

{{< julia caption="The Julia community according to my findings." >}}
using Plots

x = ["Nerds", "Hackers", "Femboys"]
y = [0.09, 0.01, 0.9]
pie(x, y, title = "The Julia Community", l = 0.5)
{{< /julia >}}