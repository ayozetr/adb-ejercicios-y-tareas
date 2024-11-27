# Ejercicio 4

| PedidoID | FechaPedido | ClienteID | ClienteNombre | ProductoID | ProductoNombre | Cantidad | PrecioUnitario |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 301 |	05/04/2023 | 501 | Juan | 1001 | Lápiz | 10 | 0.5 |
| 301 |	05/04/2023 | 501 | Juan | 1002 | Cuaderno | 5 | 1.5 |
| 302 |	06/04/2023 | 502 | María | 1003 | Bolígrafo | 8 | 0.8 |
| 303 |	07/04/2023 | 503 | Luis | 1001 | Lápiz | 12 | 0.5 |
| 303 |	07/04/2023 | 503 | Luis | 1004 | Borrador | 4 | 0.3 |


Tabla **""Clientes"**

| ClienteID | ClienteNombre |
| --- | --- |
| 501 | "Juan" |
| 502 | "María"|
| 503 | "Luis" |

Tabla **"Pedidos"**

| PedidoID | FechaPedido | ClienteID |
| --- | --- | --- |
| 301 | 05/04/2023 | 501 | 
| 301 | 05/04/2023 | 501 | 
| 302 | 06/04/2023 | 502 | 
| 303 | 07/04/2023 | 503 | 
| 303 | 07/04/2023 | 503 | 

Tabla **"Detalles"**

| PedidoID | ProductoID | Cantidad |
| --- | --- | --- |
| 301 | 1001 | 10 |
| 301 | 1002 | 5 |
| 302 | 1003 | 8 |
| 303 | 1001 | 12 |
| 303 | 1004 | 4 |

Tabla **"Productos"**

| ProductoID | ProductoNombre | PrecioUnitario |
| --- | --- | --- |
| 1001 | Lápiz | 0.5 | 
| 1002 | Cuaderno | 1.5 |
| 1003 | Bolígrafo | 0.8 |
| 1004 | Borrador | 0.3 |