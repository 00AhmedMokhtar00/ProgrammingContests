#include <bits/stdc++.h>
using namespace std;

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(0);

    long long N, K;
    cin >> N >> K;

    if (N == 1)
    {
        if (K == 0) cout << 1 << endl;
        else cout << "-1" << endl;
        return 0;
    }
    
    if (K < N/2) cout << -1 << endl;
    else if (K == N/2)
    {
        for (int i = 1; i <= N; ++i)
            cout << i << " ";
    } else {

        int d = (N-2) / 2;
        cout << K-d << " " << 2 * (K-d) << " ";
        
        assert(K - d > 0);
        int x = 3 * (int)1e8;
        for (int i = 1; i <= N - 2; ++i)
            cout << ++x << " ";
    }

    return 0;
}
