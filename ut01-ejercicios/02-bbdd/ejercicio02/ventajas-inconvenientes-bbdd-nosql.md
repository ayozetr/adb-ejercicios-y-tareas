# Ejercicio 2
__Indica dos ventajas y dos inconvenientes de las Bases de Datos NoSQL.__

* Ventajas
  * __Flexibilidad en el esquema de datos__:
Las bases de datos NoSQL permiten cambiar el esquema de datos de manera más ágil, incluso trabajar con elementos con distintos esquemas en la misma estructura. Esto facilita el almacenamiento de datos estructurados, semiestructurados y no estructurados juntos, sin necesidad de una conversión previa

  *  __Escalabilidad horizontal__:
Las bases de datos NoSQL están diseñadas para escalar horizontalmente usando clústeres distribuidos de hardware. Esto permite agregar nuevos servidores de bases de datos (nodos) a la infraestructura de manera más cómoda que en las bases de datos relacionales, lo que facilita el manejo de un mayor volumen de datos, con tráfico inmenso y sin interrupciones

ㅤ
* Inconvenientes
  * __Menor consistencia de datos__:
A diferencia de las bases de datos relacionales que ofrecen una fuerte consistencia de datos, las bases de datos NoSQL a menudo sacrifican cierto grado de consistencia para lograr mayor flexibilidad y rendimiento. Esto puede llevar a situaciones donde los datos no estén completamente sincronizados en todos los nodos

  * __Falta de estandarización__:
A diferencia de las bases de datos SQL que utilizan un lenguaje estándar (SQL), las bases de datos NoSQL carecen de un estándar unificado. Cada sistema NoSQL puede tener su propia interfaz y lenguaje de consulta, lo que puede dificultar la migración entre diferentes sistemas NoSQL y requerir un aprendizaje específico para cada plataforma