### Skill Bonus Spread BME Variant

| LE | S#1 | S#2 | S#3 | S#4 | S#5 | S#6 | S#7 | S#8 | S#9 |
|:-----:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
<%
for(int n = 0; n<51; n++) {
    def lequ = local.lequ;
    def level = lequ[n];
    print String.format('| %d ', (int)level[0]);
    for(int x = 0; x<9; x++) {
        print String.format('| +%d ', (int)level[1].bme[x]);
    }
    print '|\n';
}


// {% if false %}
//
// ### Skill Bonus Spread RMC Variant
//
// | LE | S#1 | S#2 | S#3 | S#4 | S#5 | S#6 | S#7 | S#8 | S#9 |
// |:-----:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
// {% for n in range(51) -%}
// | {{ local.lequ[n][0]|int() }}
// {%- for x in range(0,9) -%}
// | +{{ local.lequ[n][1].rmc[x]|int() }}
// {%- endfor -%}|
// {% endfor %}
//
// ### Skill Bonus Spread RMSS Variant
//
// | LE | S#1 | S#2 | S#3 | S#4 | S#5 | S#6 | S#7 | S#8 | S#9 |
// |:-----:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
// {% for n in range(51) -%}
// | {{ local.lequ[n][0]|int() }}
// {%- for x in range(0,9) -%}
// | +{{ local.lequ[n][1].rmss[x]|int() }}
// {%- endfor -%}|
// {% endfor %}
//
// {% endif %}

%>

### Attribute Spread <%= local.statname[0] %> Variant

| LE | A#1 | A#2 | A#3 | A#4 | A#5 | A#6 | A#7 | A#8 | A#9 | A#10 |
|:-----:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
<%
for(int n = 0; n<51; n++) {
    print String.format('| %d ', (int)local.stats[n][0]);
    for(int x = 0; x<9; x++) {
        def y1 = (1+(x*2));
        def y2 = (2+(x*2));
        print String.format('| %d (+%d) ', (int)local.stats[n][y1], (int)local.stats[n][y2][0]);
    }
    print '|\n';
}
%>

| Size | OB | DB | Hits | Crit |
|:------------------|:------:|:------:|:------:|:------:|
<%
for(String n : local.sizes) {
    print String.format('| %s | %d | %d | %.3f | %d |\n', n, (int)local.size[n].OB, (int)local.size[n].DB, local.size[n].HT, (int)local.size[n].CT);
}
%>

| Type | OBi | OBm | OB2i | OB2m | OB3i | OB3m | OB4i | OB4m | AT | DBi | DBm | HTi | HTm |
|:------------------|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
<%
for(String n : local.types) {
    print String.format('| %s ', n);
    print String.format('| %d | %.3f ', (int)local.type[n].OBI, local.type[n].OBM);
    print String.format('| %d | %.3f ', (int)local.type[n].OB2I, local.type[n].OB2M);
    print String.format('| %d | %.3f ', (int)local.type[n].OB3I, local.type[n].OB3M);
    print String.format('| %d | %.3f ', (int)local.type[n].OB4I, local.type[n].OB4M);
    print String.format('| %s | %d | %.3f | %d | %.3f ', local.armors[(int)local.type[n].ATI], (int)local.type[n].DBI, local.type[n].DBM, (int)local.type[n].HTI, local.type[n].HTM );
    print '|\n';
}
%>

<%
for(String n : local.types) {
    for(String n2 : local.sizes) {
%>
| <%= n %> <%= n2 %>-Size | LE | OB | OB2 | OB3 | OB4 | AT | DB | Hits |
|:------------------|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
<%
        for(int LE = 0; LE<51; LE++) {
            int obi = (int)(local.type[n].OBI-1);
            int ob2i = (int)(local.type[n].OB2I-1);
            int ob3i = (int)(local.type[n].OB3I-1);
            int ob4i = (int)(local.type[n].OB4I-1);
            int hti = (int)(local.type[n].HTI-1);
            int ati = (int)local.type[n].ATI;
            int dbi = (int)(local.type[n].DBI-1);
            def lequ = local.lequ[LE];
            def bme = lequ[1].bme;

            print String.format('| %s %s | %d | %d | %d | %d | %d | %s | %d | %d |\n',
                n, n2,
                LE,
                (int)((bme[obi]*local.type[n].OBM) + local.size[n2].OB),
                (int)((bme[ob2i]*local.type[n].OB2M) + local.size[n2].OB),
                (int)((bme[ob3i]*local.type[n].OB3M) + local.size[n2].OB),
                (int)((bme[ob4i]*local.type[n].OB4M) + local.size[n2].OB),
                local.armors[ati],
                (int)((bme[dbi]*local.type[n].DBM)+local.size[n2].DB),
                (int)(bme[hti]*local.type[n].HTM*local.size[n2].HT)
            );

        }
    }
}
%>

