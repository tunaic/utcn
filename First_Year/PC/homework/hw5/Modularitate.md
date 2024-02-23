### Studiați cum arată o tablă de șah și pozițiile inițiale ale pieselor.

Implementați următoarele funcții în fișierele sah.h și sah.c. Testați-le în main.c.
Vor fi teme ulterioare în care va trebui să continuați această implementare.

### 1. O funcție care primește o matrice de 8x8 caractere și o modifică să reprezinte tabla în configurația initială. Vom utiliza următoarea convenție: 
Rândul 0 din matrice corespunde rândului 8 al tablei;
Coloana 0 din matrice corespunde coloanei a a tablei;
Piesele albe se reprezintă cu majuscule;
Piesele negre se reprezintă cu litere mici;
Pătratele goale se reprezintă cu caracterul spatiu ' ';
Codificăm piesele folosind literele: 
rege = k, damă = q, turn = r, nebun = b, cal = n, pion = p

    void init(char table[][8])

### 2. O funcție care afișează tabla, cu următorul antet:

    void print(char table[][8])

Se afișează cu rândul 8 al tablei sus, exact cum apare în imaginile din linkul de mai sus.

### 3. O funcție cu următorul antet:

int find(char table[][8], char piece, char cols[], int rows[])

Funcția caută piesa piece în tabla table, returnează numărul ei de apariții și stochează în tabloul cols toate coloanele unde apare piesa respectiv în tabloul rows toate rândurile (vezi convenția de mai sus). Perechile formate dintre cols[i] și rows[i], pentru fiecare i, indică pozițiile piesei. Tablourile cols și rows sunt alocate în funcția main și au dimensiune suficient de mare pentru caz general.

    Exemplu, pentru poziția inițială, după apelul următor:
    int nr = find(a, 'p', cols, rows);
    avem nr = 8, cols = { 'a', 'b', …, 'h' }, rows = {7, 7, …, 7}
