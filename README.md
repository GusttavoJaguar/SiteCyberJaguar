Documentação Técnica: Projeto SiteCyberJaguar
Autor: Gusttavo Jaguar 
Repositório: SiteCyberJaguar 
**Link deploy: https://sitecyberjaguar.onrender.com/ **

Visão Geral do Projeto
O projeto SiteCyberJaguar é uma aplicação web desenvolvida com o framework Ruby on Rails. A principal funcionalidade destacada no histórico de commits é a capacidade de receber e-mails de contato diretamente pelo site, sem a necessidade de armazenar essas mensagens em um banco de dados. Isso indica o uso de ferramentas de envio de e-mail integradas ao framework.
Tecnologias e Ferramentas Utilizadas
A stack tecnológica é baseada no ecossistema Ruby on Rails, com foco em funcionalidades de comunicação:

Tecnologia
Descrição / Propósito
Ruby
Linguagem de programação principal do projeto.
Ruby on Rails (Rails)
Framework web full-stack utilizado para estruturar a aplicação.
Action Mailer
Componente nativo do Rails utilizado para compor, enviar e receber e-mails a partir da aplicação.
HTML/CSS/JavaScript
Tecnologias de frontend utilizadas para construir a interface do usuário (formulário de contato).

Arquitetura e Funcionalidades Técnicas
1. Envio de E-mails sem Persistência (Action Mailer)
A funcionalidade central do projeto é o formulário de contato. O diferencial técnico é a decisão arquitetural de não utilizar um banco de dados para armazenar as mensagens recebidas. Em vez disso, a aplicação utiliza o Action Mailer do Rails para processar os dados do formulário (nome, e-mail, mensagem) e enviá-los diretamente para a caixa de entrada do administrador (ou e-mail configurado).

Vantagens: Essa abordagem reduz a complexidade da infraestrutura (menos tabelas no banco de dados), diminui a superfície de ataque (menos dados sensíveis armazenados) e foca na entrega imediata da mensagem.
2. Configuração de SMTP
Para que o Action Mailer funcione em produção, o desenvolvedor precisou configurar um servidor SMTP (Simple Mail Transfer Protocol) nos arquivos de ambiente do Rails (ex: config/environments/production.rb). Isso demonstra conhecimento sobre como integrar serviços externos (como SendGrid, Mailgun ou Gmail) à aplicação para garantir a entrega confiável dos e-mails.
3. Estrutura MVC e Views
O projeto segue o padrão MVC do Rails. O formulário de contato é renderizado por uma View (HTML/ERB), os dados são submetidos para um Controller que os valida e, em seguida, aciona o Mailer correspondente para realizar o envio.
Nível Técnico (Júnior Avançado)
Este projeto evidencia competências específicas em desenvolvimento web com Rails, alinhando o desenvolvedor ao nível Júnior Avançado:

Domínio de Componentes Específicos: A capacidade de implementar e configurar o Action Mailer demonstra um entendimento mais profundo do framework além do básico (CRUD).

Decisões Arquiteturais: A escolha de não usar banco de dados para uma funcionalidade simples de contato mostra maturidade em avaliar trade-offs (complexidade vs. necessidade).

Integração de Serviços: A configuração de SMTP indica familiaridade com a integração de serviços de terceiros, uma habilidade essencial no desenvolvimento web moderno.

