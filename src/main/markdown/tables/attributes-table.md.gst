#### Stat Modifier Table

| Stat | Mod | Qu/DB | RR |
|:----:|:----:|:----:|:----:|
<%
for(float i=106; i>1f; i-=3f)
{
    float n = i - 50f;
    int x = (n < 0f) ? (-(Math.floor(Math.abs(n)/3f))) : Math.floor(n/3f);
    print String.format('| %d - %d | %+d | %+d | %+d |\n', (int)i-2, (int)i, x, x*3, x*2);
}

%>