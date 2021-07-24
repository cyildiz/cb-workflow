+++
title = "Basics"
date = 2021-06-30T20:59:47+02:00
weight = 5
chapter = true
pre = "<b>X. </b>"
+++

### Chapter X

# Some Chapter title

Lorem Ipsum.

## Math
$E = m c^2$

Statt $P(D_i=x|h) = \dfrac{|S_{D_i}(x) \cap S(h)|}{|S(h)|}$ nutze $P(D_i=x|h) = \dfrac{|S_{D_i}(x) \cap S(h)| + m \cdot p_i}{|S(h)| + m}$

$$
    \begin{array}{rcl}
    h_{MAP} &=& \operatorname{argmax}_{h \in H} P(h|D_1, ..., D_n) \\\\[5pt]
            &=& \operatorname{argmax}_{h \in H} P(h) \prod_i P(D_i|h) \\\\[5pt]
            &=& \operatorname{argmax}_{h \in H} [\log(P(h)) + \sum_i \log(P(D_i|h))]
    \end{array}
$$

## Images
![Sky](./images/sky.jpg)

{{< figure src="basics/images/sky.jpg" title="Sky" >}}
