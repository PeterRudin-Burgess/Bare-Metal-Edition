{
    armors: {
        types: [ "NA", "LT", "MD", "HY" ]
        base: 75
        NA: {
            eff: 75
        }
        LT: {
            // padded, leather, studded
            // eff: [ 80, 80, 85 ]
            eff: 82
        }
        MD: {
            // hide, chain shirt, scale mail, breast-plate, half plate
            // eff: [ 85, 90 , 95, 95, 100 ]
            eff: 93
        }
        HY: {
            // ring, chain, splint, plate
            // eff: [ 95, 105, 110, 115 ]
            eff: 107
        }
    }
    values: {
        K: {
            lash: 3
            improvised: 5
            centered: 7
            balanced: 8
            unbalanced: 9
        }
        L: 15
        D: 3
        H: {
            cut: [ 0.89, 1.05 ]
            chop: [1.025, 1.05 ]
            thrust: [ 0.87, 1.07 ]
            impact: [1.025, 1.05 ]
            whip: [ 0.95, 1.18 ]
            elemental: [ 0.9 , 1.05 ]
        }
        V: {
            cut: [ 1, 0.9, 0.8, 0.7 ]
            chop: [ 1, 0.9, 0.75, 0.6 ]
            thrust: [ 1, 0.95, 0.9, 0.8 ]
            impact: [ 1, 0.95, 0.9, 0.8 ]
            whip: [ 1, 0.7, 0.5, 0.3 ]
            elemental: [ 1, 0.9, 0.8, 0.7 ]
        }
        C: {
            cut: [ "slash_NA" "slash_LT" "slash_MD" "slash_HY" ]
            chop: [ "chop_NA" "chop_LT" "chop_MD" "chop_HY" ]
            thrust: [ "puncture" "puncture" "puncture" "puncture" ]
            impact: [ "impact" "impact" "impact" "impact" ]
            whip: [ "slash_NA" "slash_LT" "slash_HY" "blunt" ]
            elemental: [ "elemental" "elemental" "elemental" "elemental" ]
        }
    }
    permutation: [ 151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225, 140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148, 247, 120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57, 177, 33, 88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68,	175, 74, 165, 71, 134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111,	229, 122, 60, 211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54, 65, 25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200, 196, 135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52, 217, 226, 250, 124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207, 206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213, 119, 248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9, 129, 22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218, 246, 97, 228, 251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241, 81,	51, 145, 235, 249, 14, 239,	107, 49, 192, 214, 31, 181, 199, 106, 157, 184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 138, 236, 205, 93, 222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180 ]
    criticals: {
        none: ' '
        other: '?'
        slash: 'S'
        slash_NA: 'S'
        slash_LT: 'SSSK'
        slash_MD: 'SK'
        slash_HY: 'SKK'
        trust_NA: 'SP'
        trust_LT: 'PPS'
        trust_MD: 'PPPS'
        trust_HY: 'P'
        chop_NA: "CCCCCCK"
        chop_LT: "CCCCCCK"
        chop_MD: "CCCK"
        chop_HY: "CKK"
        bite_NA: "SSSSKPP"
        bite_LT: "SSSKKPP"
        bite_MD: "SSKKKKP"
        bite_HY: "SKKKKKP"
        blunt: 'K'
        impact: 'I'
        puncture: 'P'
        hafted: 'SSSSSKKK'
        elemental: '?'
        laser_NA: 'PF'
        laser_LT: 'PFF'
        laser_MD: 'PFF'
        laser_HY: 'PFFFF'
    }
    diceroll: [
<%
float l = 150f;
float x = 1f;
for(float i=(l-x); i>12f; i-=x)
{
    int n = (float)l;
    int n2 = (float)i;
    print String.format('\t\t[ %d, %d ]\n', n2, n);
    l = n2-1;
    x+=0.45;
}
%>
    ]
    dr-short: [
<%
l = 150f;
x = 1f;
for(float i=(l-x); i>40f; i-=x)
{
    int n = (float)l;
    int n2 = (float)i;
    print String.format('\t\t[ %d, %d ]\n', n2, n);
    l = n2-1;
    x+=1.15;
}
%>
    ]
    dr-full: [
<%
l = 150f;
x = 1f;
for(float i=(l-x); i>49f; i-=x)
{
    int n = (float)l;
    int n2 = (float)i;
    print String.format('\t\t[ %d, %d ]\n', n2, n);
    l = n2-1;
    x+=0.035;
}
%>
    ]
}