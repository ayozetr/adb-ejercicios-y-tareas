# Ejercicio 5

| RegistroID | EstudianteID | NombreEstudiante | Cursos | Profesor | Notas | Departamento |
| ---------- | ------------ | ---------------- | ------ | -------- | ----- | ------------ |
| 1 | 201 | Alicia | "Matemáticas, Física" | "Dr. Pérez" | "85, 90" | Ciencias |
| 2 | 202 |	Roberto | "Matemáticas, Química" | "Dr. Pérez" | "78, 88" | Ciencias |
| 3 | 203 |	Julia |	"Historia, Literatura" | "Dr. Gómez" | "92, 80" | Humanidades |
| 4 | 204 |	Mario |	"Química" |	"Dr. Pérez" | "75" | Ciencias |

Tabla **"Profesores"**

| Profesor | Departamento | 
| -------- | ------------ |
| "Dr. Pérez" | Ciencias |
| "Dr. Pérez" | Humanidades |

Tabla **"Alumnos"**

| RegistroID | EstudianteID | NombreEstudiante |
| ---------- | ------------ | ---------------- |
| 1 | 201 | Alicia |
| 2 | 202 | Roberto |
| 3 | 203 | Julia |
| 4 | 204 | Mario |

Tabla **"Cursos"**

| Curso | Profesor |
| ----- | -------- |
| Matemáticas | "Dr. Pérez" |
| Física | "Dr. Pérez" |
| Química | "Dr. Pérez" |
| Historia | "Dr. Gómez" |
| Literatura |  "Dr. Gómez" |s

Tabla **"cursos-alumnos"**

| EstudianteID | Notas | Curso |
| ------------ | ----- | ----- |
| 201 | 85 | Matemáticas |
| 201 | 90 | Física |
| 202 | 78 | Matemáticas |
| 202 | 88 | Química |
| 203 | 92 | Historia |
| 203 | 80 | Literatura |
| 204 | 75 | Química |
