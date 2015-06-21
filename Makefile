all:
	adocker build -t azukiapp/node 0.12
	adocker build -t azukiapp/node:0.12 0.12

no-cache:
	adocker build --rm --no-cache -t azukiapp/node 0.12
	adocker build --rm --no-cache -t azukiapp/node:0.12 0.12
