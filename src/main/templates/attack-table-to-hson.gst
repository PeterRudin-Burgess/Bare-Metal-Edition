{
<%

print String.format('\ttitle: %s\n', data.title);
print '\tdata: [\n';

def DV = 0;

if(data.DV)
{
    DV = data.DV;
}
else
{
    def W = data.W; //kg
    def L = data.L; //cm

    def K = attack.values.K[data.K];

    DV = (Math.pow((W * L / attack.values.L), 0.25f) * K) * attack.values.D;
}

def start = data.start;
def end = data.end;
def start2 = data.start+10;
def end2 = data.end;
def count = attack.armors.types.size();

for(n in 0 .. (count-1))
{
    print String.format('\t// %s\n', attack.armors.types[n]);
    print String.format('\t{   type: %s\n', attack.values.C[data.VHC][n]);

    def DVx=DV*attack.values.V[data.VHC][n];
    def A=(start2+attack.armors[attack.armors.types[n]].eff-attack.armors.base);
    def cm = end2-A;
    def B = A+(0.25 * cm);
    def C = A+(0.45 * cm);
    def D = A+(0.65 * cm);
    def E = A+(0.85 * cm);
    print String.format('\tstart: %d\n\tend: %d\n\tmin: 1\n\tmax: %d\n\tA: %d\n\tB: %d\n\tC: %d\n\tD: %d\n\tE: %d\n\n', (int)start, (int)end, (int)DVx, (int)A, (int)B, (int)C, (int)D, (int)E);
    print String.format('\tpow0: %05f\n', Math.pow(attack.values.H[data.VHC][0], n));
    print String.format('\tpow1: %05f\n', Math.pow(attack.values.H[data.VHC][1], n));
    print '}\n';

    start*=attack.values.H[data.VHC][0];
    start2*=attack.values.H[data.VHC][1];
    end2*=attack.values.H[data.VHC][1];

}

%>
    ]
}