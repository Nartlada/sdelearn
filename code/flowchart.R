all = nrow(dfall)
exc = all - nrow(df)
exc1 = nrow(filter(dfall,
  !(tb_def %in% 1:2 & tb_diag %in% 1:3) &
  !(tb_def == 0 & tb_diag == 0) &
  !(is.na(tb_def) | is.na(tb_diag))
))
exc2 = nrow(filter(dfall, age < 15 | is.na(age)))
exc3 = nrow(filter(dfall, !(active_tb_alere_determine_test_result %in% 1:2)))
exc4 = nrow(filter(dfall, is.na(tb_diag)))
exc5 = nrow(filter(dfall, is.na(antituberculosis_drugs_receive) & tb_diag == 1))

inc = all - exc
t1 <- table(df$tb_def, useNA = 'always')
t2 <- table(df$lam, df$tb_def, useNA = 'always')

# Texts for figures
l1 <- paste0('All PLHIV in the database\n(n = ', prettyNum(all, big.mark = ","), ')')
l2 <- paste0('Excluded (n = ', prettyNum(exc, big.mark = ","), ')')
l3 <- paste0('Conflict between definition and diagnosis (n = ', prettyNum(exc1, big.mark = ","), ')')
l4 <- paste0('Age less than 15 or missing (n = ', prettyNum(exc2, big.mark = ","), ')')
l5 <- paste0('Incomplete documented LF-LAM result (n = ', prettyNum(exc3, big.mark = ","), ')')
l6 <- paste0('Incomplete documented routine TB diagnosis (n = ', prettyNum(exc4, big.mark = ","), ')')
l7 <- paste0('Incomplete TB treatment information (n = ', prettyNum(exc5, big.mark = ","), ')')
l8 <- paste0('Included in analysis PLHIV >= 15 years old\n(n = ', prettyNum(inc, big.mark = ","), ')')
l9 <- paste0('Definite TB\n(n = ', prettyNum(t1[1], big.mark = ","), ')')
l10 <- paste0('Probable TB\n(n = ', prettyNum(t1[2], big.mark = ","), ')')
l11 <- paste0('No TB\n(n = ', prettyNum(t1[3], big.mark = ","), ')')
l12 <- paste0('Urine LAM positivity (n = ', prettyNum(t2[2, 1], big.mark = ","), ')')
l13 <- paste0('Urine LAM negativity (n = ', prettyNum(t2[1, 1], big.mark = ","), ')')
l14 <- paste0('Urine LAM positivity (n = ', prettyNum(t2[2, 2], big.mark = ","), ')')
l15 <- paste0('Urine LAM negativity (n = ', prettyNum(t2[1, 2], big.mark = ","), ')')
l16 <- paste0('Urine LAM positivity (n = ', prettyNum(t2[2, 3], big.mark = ","), ')')
l17 <- paste0('Urine LAM negativity (n = ', prettyNum(t2[1, 3], big.mark = ","), ')')

d <- DiagrammeR::grViz(
  "digraph flowchart {

    graph [layout = dot,
           nodesep = 1;
           compound = true]

    node [shape = box,
          fixedsize = t,
          width = 4,
          height = 0.8,
          style = filled,
          color = gray,
          fillcolor = WhiteSmoke,
          fontname = Helvetica,
          fontsize = 20]

    all [label = '@@1']
    exclude [label = 
<
@@2<br/><br/>
&#8226; @@3<br ALIGN = 'LEFT'/>
&#8226; @@4<br ALIGN = 'LEFT'/>
&#8226; @@5<br ALIGN = 'LEFT'/>
&#8226; @@6<br ALIGN = 'LEFT'/>
&#8226; @@7<br ALIGN = 'LEFT'/>
>
    ]
    inc [label = '@@8']
    def [label = '@@9', fillcolor=orangered]
    prob [label = '@@10', fillcolor=orange]
    not [label = '@@11', fillcolor=green]
    defpn [label = 
<
@@12<br/>
@@13<br/>
>
    , fillcolor=orangered]
    probpn [label = 
<
@@14<br/>
@@15<br/>
>
    , fillcolor=orange]
    notpn [label = 
<
@@16<br/>
@@17<br/>
>
    , fillcolor=green]

    blank1 [label = '', width = 0.01, height = 0.01]
    blank2 [label = '', width = 0.01, height = 0.01]

    all -> blank1 [dir = none];
    blank1 -> exclude;
    {rank = same; blank1 exclude};
    blank1 -> inc;
    inc -> blank2 [dir = none];
    blank2 -> def;
    blank2 -> prob;
    blank2 -> not;
    {rank = same; def prob not};
    def -> defpn;
    prob -> probpn;
    not -> notpn;
    {rank = same; defpn probpn notpn};
  }

  [1]: l1
  [2]: l2
  [3]: l3
  [4]: l4
  [5]: l5
  [6]: l6
  [7]: l7
  [8]: l8
  [9]: l9
  [10]: l10
  [11]: l11
  [12]: l12
  [13]: l13
  [14]: l14
  [15]: l15
  [16]: l16
  [17]: l17
  
")

