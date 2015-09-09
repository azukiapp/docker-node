all:
	adocker build -t azukiapp/node:0.10 0.10
	adocker build -t azukiapp/node:0.12 0.12
	adocker build -t azukiapp/node 4.0.0

no-cache:
	adocker build --rm --no-cache -t azukiapp/node:0.10 0.10
	adocker build --rm --no-cache -t azukiapp/node:0.12 0.12
	adocker build --rm --no-cache -t azukiapp/node 4.0.0
