import java.util.*;
import java.io.*;



public class tree_height {
    class FastScanner {
		StringTokenizer tok = new StringTokenizer("");
		BufferedReader in;

		FastScanner() {
			in = new BufferedReader(new InputStreamReader(System.in));
		}

		String next() throws IOException {
			while (!tok.hasMoreElements())
				tok = new StringTokenizer(in.readLine());
			return tok.nextToken();
		}
		int nextInt() throws IOException {
			return Integer.parseInt(next());
		}
	}

	public class TreeHeight {
		int n;
		int a[];
		int b[];
		int j = -1;
		int i = 0;

		void read() throws IOException {
			FastScanner in = new FastScanner();
			n = in.nextInt();
			a = new int[n];
			b = new int[n];
			
			for (int i = 0; i < n; i++) {
				a[i] = in.nextInt();
				b[i] = -1;
			}
		}

		int height(){
		    for(i=0;i<n;i++) {
		        level(i);
		    }
		    for(i=0;i<n;i++){
	        	j = Math.max(b[i], j);
	        }
		    
		    return j + 1;    
		}

		void level(int i)
		{
			if(a[i]==-1)
				b[i]=0;
			else if(b[a[i]]!=-1)
				b[i]=b[a[i]]+1;
			else {
				level(a[i]);
				b[i]=b[a[i]]+1;
			}
			return;
		}
	}

	static public void main(String[] args) throws IOException {
            new Thread(null, new Runnable() {
                    public void run() {
                        try {
                            new tree_height().run();
                        } catch (IOException e) {
                        }
                    }
                }, "1", 1 << 26).start();
	}
	public void run() throws IOException {
		TreeHeight tree = new TreeHeight();
		tree.read();
		System.out.println(tree.height());
	}
}

