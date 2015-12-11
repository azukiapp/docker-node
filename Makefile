all:
	adocker build -t azukiapp/node:latest                  5
	adocker build -t azukiapp/node:5.2.0                   5
	adocker build -t azukiapp/node:5.2                     5
	adocker build -t azukiapp/node:5                       5
	adocker build -t azukiapp/node:4.2.1                   4
	adocker build -t azukiapp/node:4.2                     4
	adocker build -t azukiapp/node:4                       4
	adocker build -t azukiapp/node:0.12.7                  0.12
	adocker build -t azukiapp/node:0.12                    0.12
	adocker build -t azukiapp/node:0.10.40                 0.10
	adocker build -t azukiapp/node:0.10                    0.10

no-cache:
	adocker build --rm --no-cache -t azukiapp/node:latest  5
	adocker build --rm --no-cache -t azukiapp/node:5.2.0   5
	adocker build --rm --no-cache -t azukiapp/node:5.2     5
	adocker build --rm --no-cache -t azukiapp/node:5       5
	adocker build --rm --no-cache -t azukiapp/node:latest  4
	adocker build --rm --no-cache -t azukiapp/node:4.2.1   4
	adocker build --rm --no-cache -t azukiapp/node:4.2     4
	adocker build --rm --no-cache -t azukiapp/node:4       4
	adocker build --rm --no-cache -t azukiapp/node:0.12.7  0.12
	adocker build --rm --no-cache -t azukiapp/node:0.12    0.12
	adocker build --rm --no-cache -t azukiapp/node:0.10.40 0.10
	adocker build --rm --no-cache -t azukiapp/node:0.10    0.10
