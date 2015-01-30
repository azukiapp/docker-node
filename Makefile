all:
	adocker build -t azukiapp/node 0.10

no-cache:
	adocker build --rm --no-cache -t azukiapp/node 0.10
