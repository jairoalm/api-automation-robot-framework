Para rodar todos testes:
> robot -d .\reports services/ms-usuarios

Para rodar um arquivo específico de testes:
> robot -d .\reports services/ms-usuarios\<the_test>.robot

Para executar o projeto por tags:
> robot -d .\reports -i <tag> -i <tag> services/ms-usuarios\<the_test>.robot

Bibliotecas
> pip install robotframework-faker
> pip install robotframework-requests