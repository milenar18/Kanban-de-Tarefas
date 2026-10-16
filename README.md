# Kanban de Tarefas

Quadro de tarefas em português com identidade visual rose, cartões interativos e autenticação pelo Supabase.

## Executar localmente

Abra a pasta com um servidor HTTP local e acesse `index.html`. O app usa módulos JavaScript e não deve ser aberto diretamente como arquivo (`file://`).

## Supabase

1. Confira a URL do projeto e a chave pública em `supabase-config.js`.
2. Execute `supabase/schema.sql` no SQL Editor do projeto Supabase.
3. Em **Authentication → URL Configuration**, permita o endereço onde o app está hospedado.

As tarefas ficam associadas à conta autenticada e as políticas RLS limitam o acesso aos dados de cada usuário.
