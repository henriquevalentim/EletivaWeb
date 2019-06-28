

--nome do banco 'bancoweb'

CREATE TABLE public.tb_cliente
(
    cli_id serial NOT NULL,
    cli_nome character varying(100),
    cli_email character varying(100),
    cli_cpf character varying(20),
    cli_cep character varying(20),
    cli_logradouro character varying(100),
    cli_bairro character varying(50),
    cli_estado character varying(50),
    cli_numero character varying(50),
    cli_municipio character varying(100),
    cli_usu_id integer,
    CONSTRAINT tb_cliente_pkey PRIMARY KEY (cli_id)
);


CREATE TABLE public.tb_usuario
(
    usu_id serial NOT NULL,
    usu_login character varying(100),
    usu_senha character varying(100),
    usu_nivel_acesso integer DEFAULT 0,
    CONSTRAINT tb_usuario_pkey PRIMARY KEY (usu_id)
);

CREATE TABLE public.categoria
(
    cat_id serial NOT NULL ,
    cat_nome character varying(200),
    CONSTRAINT categoria_pkey PRIMARY KEY (cat_id)
);

CREATE TABLE public.produto
(
    pro_id serial NOT NULL,
    pro_nome character varying(100),
    pro_descricao character varying(5000),
    pro_preco_compra double precision,
    pro_preco_venda double precision,
    pro_url_foto character varying(100),
    pro_cat_id integer,
    CONSTRAINT produto_pkey PRIMARY KEY (pro_id),
    CONSTRAINT produto_pro_cat_id_fkey FOREIGN KEY (pro_cat_id)
        REFERENCES categoria (cat_id) MATCH SIMPLE
);

CREATE TABLE public.tb_venda
(
    ven_id serial NOT NULL,
    ven_data date DEFAULT CURRENT_DATE,
    ven_total numeric(8,2),
    ven_usu_id integer,
    CONSTRAINT tb_venda_pkey PRIMARY KEY (ven_id)
);

CREATE TABLE public.tb_itens_venda
(
    itens_id serial NOT NULL,
    itens_ven_id integer,
    itens_pro_id integer,
    CONSTRAINT tb_itens_venda_pkey PRIMARY KEY (itens_id)
);


INSERT INTO categoria (cat_id, cat_nome) values ('1','jogo_ps');
INSERT INTO categoria (cat_id, cat_nome) values ('2','acessorio_ps');
INSERT INTO categoria (cat_id, cat_nome) values ('3','console_ps');
INSERT INTO categoria (cat_id, cat_nome) values ('4','jogo_xbox');
INSERT INTO categoria (cat_id, cat_nome) values ('5','acessorio_xbox');
INSERT INTO categoria (cat_id, cat_nome) values ('6','console_xbox');
INSERT INTO categoria (cat_id, cat_nome) values ('7','jogo_switch');
INSERT INTO categoria (cat_id, cat_nome) values ('8','acessorio_switch');
INSERT INTO categoria (cat_id, cat_nome) values ('9','console_switch');

INSERT INTO public.tb_usuario(
	usu_login, usu_senha, usu_nivel_acesso)
	VALUES ( 'admin@gmail.com', 'admin', 1);

INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CALL OF DUTY: WORLD WAR II PTBR CPP (NAC-BRA) PS4 ACT','Desembarque na Normandia no Dia D e participe de batalhas por toda a Europa em lugares icônicos da guerra mais monumental da história. Experimente o clássico combate de Call of Duty. os laços de camaradagem. e a natureza implacável da guerra.',100.9,143.9,'img/jogo/1jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('MARVELS SPIDER-MAN PS4','Marvels Spider-Man traz uma nova experiência com o Homem-Aranha chegando exclusivamente ao PlayStation 4, ele é um dos super-heróis mais carismáticos e emblemáticos do mundo. ',120.5,189.9,'img/jogo/2jogo.png',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('RESIDENT EVIL 7 ING CPI (IMP-EUA2) PS4 CAP','Resident Evil® 7 biohazard traça um novo rumo para a série Resident Evil ® ao se concentrar nas raízes da franquia para proporcionar uma experiência de terror verdadeiramente aterrorizante. O jogo se passa em uma sinistra fazenda em Dulvey, Louisiana, após os acontecimentos dramáticos de of Resident Evil 6.',85.9,127.9,'img/jogo/3jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('TOM CLANCYS RAINBOW SIX: SIEGE PTBR CPP (NAC-BRA) PS4','Inspirado pela realidade dos agentes contra extremistass no mundo todo, Rainbow Six Siege convida os jogadores a dominar a arte da destruição. Intensos confrontos à curta distância, alta mortalidade, táticas, trabalho em equipe e ação explosiva estão no centro dessa experiência.',50,99.9,'img/jogo/4jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('JUMP FORCE PS4','Pela primeira vez na história, os mais famosos heróis dos Mangás serão lançados em um campo de batalha totalmente novo: o nosso mundo. Unidos para lutar contra a maior e mais perigosa ameaça de todas, agora o destino de toda a humanidade está nas mãos da Jump Force.',180.9,249.9,'img/jogo/5jogo.jpeg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('METRO EXODUS PS4','Produzido pela 4A Games, Metro Exodus é um jogo de tiro em primeira pessoa impressionante com uma história envolvente. O jogo mistura combates letais e furtividade com exploração e terror de sobrevivência em um dos universos mais imersivos já criados.',180.9,249.9,'img/jogo/6jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('ANTHEM PS4','Anthem™ é um convite para vivenciar um RPG cooperativo de ação ambientado em um mundo novo e misterioso criado pela BioWare™ e pela EA.',180.9,249.9,'img/jogo/7jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('RESIDENT EVIL 2 PS4','Resident Evil 2, a obra-prima que definiu um gênero, está de volta completamente reconstruído do zero para proporcionar uma experiência narrativa mais profunda.',180.9,249.9,'img/jogo/8jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('JUST CAUSE 4 - DAY ONE EDITION PS4','Bem-vindo a Solis, um país sul-americano de conflitos, opressão e condições climáticas extremas. Jogue pela primeira vez um jogo com tornados e tempestades tropicais, levando a icônica ação de Just Cause a novos patamares insanos.',110.9,179.9,'img/jogo/9jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('BATTLEFIELD V PS4','Entre no maior conflito da humanidade com Battlefield™ V com a série retornando às suas raízes em uma representação nunca antes vista da 2ª Guerra Mundial. Encare a guerra física total no multiplayer com seu pelotão em modos como o vasto Operações Grandiosas e o cooperativo Armas Combinadas, ou testemunhe o sofrimento humano com o combate global em Histórias de Guerra para um jogador.',100,199.9,'img/jogo/10jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('JUST DANCE 19 PS4','Prepare-se para aumentar o volume e libertar o dançarino dentro de você com Just Dance® 2019!',110,179.9,'img/jogo/11jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('HITMAN 2 PS4','Faça do mundo a sua arma. Torne-se o Agente 47 e arruíne a milícia do cliente anônimo elusivo. Use sua criatividade mortal ao viajar pelo mundo para eliminar seus alvos em 6 novos ambientes, elabore estratégias para cometer cada assassinato e explore o episódio mais inovador da franquia.',180.9,249.9,'img/jogo/12jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CALL OF DUTY: BLACK OPS 4 PS4','O modo multijogador de Call of Duty®: Black Ops 4 eleva o nível, entregando a experiência mais emocionante da série mantendo o foco nas táticas e nas escolhas dos jogadores, jogabilidade 100% no chão. O jogo oferece um novo nível de ação online com vários novos armamentos, mapas e modos. Pela primeira vez, o modo Multijogador serve como o centro da narrativa do game, à medida que os jogadores exploram o papel de cada Especialista e os estilos de jogo exclusivos. Combinado com a habilidade de desbloquear Score streaks devastadores, os jogadores terão a oportunidade de serem monstros sozinhos ou destruidores em equipe.',100,199.9,'img/jogo/13jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('RED DEAD REDEMPTION 2 PS4','Estados Unidos, 1899. O fim da era do velho oeste começou, e as autoridades estão caçando as últimas gangues de fora da lei que restam.',150.9,229.9,'img/jogo/14jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('METAL GEAR SURVIVE TRI CPI PS4 SON','O jogo traz um mundo aberto para o jogador explorar, tudo isso na perspectiva de terceira pessoa, já presente na saga. O jogo conta, além do modo local, com um modo cooperativo online, onde você e outros jogadores deverão sobreviver aos ataques de diversos zumbis. Então utilize todas as suas habilidades para sobreviver neste mundo repleto de terror e morte.',49.9,99.9,'img/jogo/15jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('NARUTO TO BORUTO SHINOBI STRIKER EDIÇÃO DE LANÇAMENTO PS4','A franquia Naruto está de volta para uma novíssima experiência em NARUTO TO BORUTO: SHINOBI STRIKER! Este novo jogo permite que os jogadores batalhem em equipes de 4 para competir contra outras equipes online!',150,199.9,'img/jogo/16jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('TITANFALL 2 PTBR CPP (NAC-BRA) PS4 EA','O piloto e o titã irão unir-se como nunca o fizeram antes no muito aguardado Titanfall 2 da Respawn Entertainment.',49.9,99.9,'img/jogo/17jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('FINAL FANTASY XV: EDIÇÃO DE PRÉ-VENDA ING CPP (NAC-BRA) PS4 SQUARE','Prepare-se para estar no centro da aventura de fantasia definitiva. Entre no mundo de Final Fantasy XV e participe de batalhas épicas e cheias de ação em sua jornada.',49.9,99.9,'img/jogo/18jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('GHOST RECON WILDLANDS PTBR CPP (NAC-BRA) PS4 UBI','O cartel de drogas Santa Blanca transformou o belo país Sul Americano da Bolívia em um perigoso narco-estado, causando criminalidade, medo e violência excessiva. Por anos, as pessoas inocentes da Bolívia sofreram com a influência criminal do cartel, mas toda a esperança não está perdida. Apenas os Ghosts, um time de elite das Forças Especiais Americanas pode salvar o país do completo colapso. Armados com sua perícia tática, e a mais moderna tecnologia em armas, os Ghosts irão se infiltrar no coração do território inimigo para completar sua missão mais perigosa até hoje. Eles terão que esmagar a aliança entre o governo corrupto e o perigoso cartel, antes que Santa Blanca esteja acima da Bolívia, e se torne uma ameaça global invencível. Enfrentando um poderoso adversário, em um mundo massivo e hostil, você terá que confiar na sua força, aperfeiçoar suas habilidades e ter nervos de aço para se tornar um Ghost, e tomar a Bolívia de volta de seus tiranos do cartel.',70,109.9,'img/jogo/19jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('GRAND THEFT AUTO V ING CPP (NAC-BRA) PS4 T2','Edição da aclamada série GTA que conta a história de um personagem que tenta escapar de seu passado, mas é sempre atraído de volta para o crime e a violência.',70.9,135.9,'img/jogo/20jogo.jpg',1);


INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Under Night In-Birth Exe:Late[st]','Under Night In-Birth Exe:Late[st] expande o jogo de luta original adicionando novos personagens, um robusto modo história, modo tutorial, batalhas online melhoradas e mais! UNIELST atinge o equilíbrio perfeito entre acessibilidade e profundidade, oferecendo uma experiência que veteranos e novatos do gênero podem curtir! Escolha entre 20 personagens únicos e junte-se a eles em sua perigosa jornada por Hollow Night.',79.9,122.9,'img/jogo/22jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Just Dance® 2018','Não importa de onde venhas, se és novo ou velho, se és um panda ou uma cenoura: aumenta o volume e prepara-te para libertar o dançarino que há dentro de ti! O Just Dance 2018 vai regressar a 24 de outubro de 2017 com mais de 40 faixas no lançamento.',99.9,143.5,'img/jogo/23jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Persona 5: Ultimate Edition','Os Phantom Thieves definitivamente roubarão o seu coração com a Ultimate Edition do Persona 5! ',150.9,325.9,'img/jogo/24jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Carros 3: Correndo para Vencer','Ligue seu motor e prepare-se para a experiência suprema de corridas em Carros 3: Correndo para Vencer, inspirado no filme da Disney•Pixar, Carros 3. Jogue com mais de 20 personagens personalizáveis incluindo Relâmpago McQueen, Jackson Storm, Cruz Ramirez e a próxima geração de corredores em mais de 20 pistas posicionadas em lugares marcantes do filme como Radiator Springs. Treine e melhore suas habilidades em 6 modos de jogo e desafie sua família e amigos na Corrida Mortal para se tornar o Campeão Supremo. No caminho para se tornar o corredor da Galeria da Fama, treinamento e habilidade irão lhe dar vantagem em uma corrida em que qualquer um pode vencer.',69.9,107.5,'img/jogo/25jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Mafia II','Mafia II oferece um olhar sumptuoso sobre o mundo obscuro e implacável da Máfia. Os tiroteios, a adrenalina, o combate brutal e a condução no limite rompem pelo ecrã numa experiência cinemática ao estilo de Hollywood. Esta é a história intrigante de Vito Scaletta, que juntamente com o seu amigo de infância, Joe, irá mergulhar no mundo do crime organizado. Juntos, irão trabalhar para provar o seu valor à Máfia e ganhar a sua reputação nas ruas. Após começarem com pequenos trabalhos como assaltos e roubos de automóveis, Vito e Joe rapidamente sobem na hierarquia da Máfia… mas a vida de um mafioso não é tão glamorosa como parece.',50.9,107.5,'img/jogo/26jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Prince of Persia: The Forgotten Sands™','Prince of Persia O Forgotten Sands é o próximo capítulo do universo Sands of Time favorito dos fãs. Visitando o reino de seu irmão após sua aventura em Azad, o príncipe encontra o palácio real sob o cerco de um poderoso exército empenhado em sua destruição.',25.99,40.99,'img/jogo/27jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Madden NFL 17','Madden NFL 17 introduz recursos imersivos que colocam você no centro da batalha do time pelo campeonato, concentrando-se no Modo Franchise, e apresentando novas maneiras de jogar e mais escolhas a fazer. Use as inovadoras dicas de reação a quem tenha a posse de bola, fintas para defensores e um sistema de IA defensivo inovador e autêntico. Receba análises de partida dinâmicas e minuciosas durante toda a temporada da NFL, feitas pela inédita equipe de comentaristas de Madden NFL: Brandon Gaudin e Charles Davis. Madden NFL 17 é o maior Madden de todos, apresentando a jogabilidade mais equilibrada da franquia, a maior diversificação de comentários de toda a franquia, e novos modos de jogo como Ultimate Team™ e Draft Champions. ',80.99,169.9,'img/jogo/28jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('GRANDIA® III','Grandia III leva a aventura aos céus colocando você na pele de Yuki, um jovem que tem o sonho de pilotar seu próprio avião. Logo, ele conhece uma garota chamada Alfina, uma comunicadora que consegue falar com os guardiões (deuses gigantes e animalescos que protegem os cidadãos). Quando o mundo enfrentar o maior perigo de sua existência, será que um aspirante a piloto e uma comunicadora inexperiente conseguirão salvar todos?',19.9,30.9,'img/jogo/29jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('LEGO® Star Wars™: LEGO® Star Wars™: The Force Awakens de Luxo','Em LEGO Star Wars: The Force Awakens, os jogadores revivem a ação épica do filme de sucesso Star Wars: O Despertar da Força, recontada através da esperta e engenhosa lente da LEGO. O jogo também traz um novo conteúdo jogável que explora o tempo entre Star Wars: O Retorno de Jedi e Star Wars: O Despertar da Força. LEGO Star Wars: The Force Awakens também apresenta multiconstruções e batalhas de blaster ao universo dos jogos LEGO. Com multiconstruções, use tijolos LEGO disponíveis para abrir novos caminhos e depois refazê-los para abrir outro! E mais outro! Durante as batalhas de blaster, use o ambiente ao seu redor para se proteger e lutar contra a Primeira Ordem.',99.9,159.9,'img/jogo/30jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Odin Sphere Leifthrasir','Bem-vindo ao deslumbrante mundo ilustrado the Odin Sphere Leifthrasir! Terrenos nevados, florestas de esmeraldas, e abismos de fogo o desafiam em uma história à ser desvendada. Conheça o mundo de Erion à medida que se enfrenta o fim dos dias assim como os reinos em guerra que se confrontam pelo controle. Assuma o controle dos magníficos personagens em questão nesse universo encantado, cheio de criaturas míticas e monstros colossais. Cinco personagens se revezam e cada capítulo destaca um único protagonista e suas lutas. Gráficos completamente redesenhado e uma experiência de jogo reformulada fazem este querido RPG de ação em 2D parecer completamente novo! Escolha Modo Refinado para jogar com mais cenas, novos monstros e um um sistema de batalhas atualizado. Ou, reviva o Modo Clássico para sentir a versão de 2007 do jogo com gráficos atualizados. Seja qual for o modo que você escolher, você será capaz de vivenciar plenamente os complexos elementos assim como sua arte de tirar o fôlego.',101.9,191.9,'img/jogo/31jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Pacote Call of Duty®: Modern Warfare®','Este pacote inclui todos os 3 jogos da franquia Call of Duty®: Modern Warfare® e os seus respectivos pacotes de DLC. Call of Duty® 4: Modern Warfare® venceu mais de 15 resenhas de pontuação perfeita e mais de 50 prêmios entre Escolha do Editor e Jogo do Ano. Seu pacote de mapas Variety vem com quatro mapas adicionais: Broadcast, Creek, Chinatown e Killhouse. O Call of Duty®: Modern Warfare® 2 continua logo após os eventos históricos do seu antecessor. O pacote Stimulus inclui cinco mapas: Crash, Overgrown, Bailout, Salvage e Storm. O Call of Duty® 4: Modern Warfare® 3 é o terceiro e o final épico da série. Sua coleção de pacotes para baixar 1 inclui quatro mapas: Liberation, Piazza, Overwatch e Black Box. E mais duas missões especiais: Black Ice e Negotiator.',100.9,179.9,'img/jogo/32jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('The Walking Dead: Michonne - Ep. 1, In Too Deep','The Walking Dead: Michonne - A Telltale Miniseries traz a personagem icônica da série dos quadrinhos, assombrada pelo passado e lidando com perdas e arrependimentos inimagináveis. A história explora sua jornada durante o período das edições 126 e 139. Através da miniseries de 3 episódios, os jogadores irão descobrir o que levou Michonne a se afastar de Rick, Ezekiel, e de todo o grupo do qual ela confia... e o que a trouxe de volta.',8.9,17.9,'img/jogo/33jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Rugby Challenge 3','Inclinar! Ligar! Pousar! NOVO RUGBY DE SETE. A trazer o realismo e a ação rápida de Rugby com sete de cada lado. NOVO MODO SEJA UM PROFISSIONAL. Controle o seu próprio destino ao longo de 13 épocas cheias de ação começando como principiante e terminando como um profissional. NOVO CONCENTRADOR DE FÃS. Criador interativo de jogador que lhe permite criar-se a si mesmo(a) e jogar através das classificações. CRIAR E DESCARREGAR. Jogadores e equipas personalizados com nova funcionalidade de tatuagem, partilhada online através de todas as plataformas. COMENTÁRIOS EM TEMPO REAL. Por Grant Nisbett e Justin Marshall. Comentários em francês por Eric Bayle e Thomas Lombard. MÚLTIPLOS MODOS DE JOGO. Incluindo: Jogo Simples, Múltiplas equipas, Competição, Modo de Carreira extensa de múltiplos anos, Modo Seja como um Profissional e Online. MAIS DE 11 COMPETIÇÕES. Incluindo o novíssimo Super Rugby, Taça ITM e Taça Currie.',45.99,91.9,'img/jogo/34jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('MotoGP™15','As emoções da série MotoGP™ voltam a acelerar com uma experiência ainda mais detalhada e envolvente! Parte para a pista com todos os pilotos das temporadas de 2015 e 2014 e ainda com campeões lendários do passado. Compete em todas as pistas oficiais e coloca as tuas habilidades à prova com novos modos de jogo como Beat The Time, Real Events 2014 offline e Split Time online e cria e personaliza a tua equipa no emocionante modo Career, com ainda mais opções que antes. Prepara-te para as experiências mais arrebatadoras e compete frente a frente contra os teus adversários. Consegues chegar ao pódio?',69.9,122.9,'img/jogo/35jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('SAMURAI WARRIORS 4 Empires','Chegou o mais recente título da aclamada série "Empires" que junta a ação frenética da série Warriors com uma vertente de estratégia e expansão territorial! A fazer a sua estreia está um novo e intuitivo sistema de gestão política onde os melhores oficiais podem ser simplesmente colocados nas suas posições mais eficazes, enquanto que as batalhas cooperativas estão agora ainda mais potentes. O foco adicional nos episódios históricos e na interação entre as personagens também serve para criar um maior sentido dramático. O "Genesis Mode", onde podes criar a tua própria era dos Estados Combatentes, dá-te ainda mais liberdade individual para a personalização! Desfruta da derradeira batalha pela supremacia!',69.9,122.9,'img/jogo/36jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Amplitude','Amplitude inclui uma campanha individual apresentada como um álbum conceitual de ficção científica de 15 músicas com uma narrativa que segue o visual, música e letras do jogo. Viaje pela mente humana expandida enquanto tenta acordar um paciente em coma ampliando a sua percepção. Amplitude também inclui um modo multijogador para até quatro jogadores, com suporte para competição livre, time x time ou perseguição de pontos cooperativa. As classificações também estão presentes, para você se gabar, se sentir bem consigo mesmo ou ser humilhado, conforme seu nível de habilidade. Com uma trilha sonora de mais 30 músicas, Amplitude inclui faixas de artistas incríveis como Darren Korb (Transistor), C418 (Minecraft), Danny Baranowsky (Crypt of the Necrodancer), Insomniac Games e Freezepop, financiadores do Kickstarter e músicas maravilhosas criadas pelos talentosos compositores internos da Harmonix.',30.5,61.5,'img/jogo/37jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Grand Theft Auto V','Grand Theft Auto V e um Pacote de Dinheiro Megalodonte valendo GTA$8.000.000 para gastar no GTA Online.',159.9,375.9,'img/jogo/38jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('BioShock Infinite: Ultimate Edition','Viva a história completa do premiado BioShock Infinite com BioShock Infinite: The Complete Edition. Esse pacote inclui o jogo principal e todas as expansões disponíveis, incluindo Clash In the Clouds e os episódios 1 e 2 de Burial at Sea. Traga a garota e quite sua dívida. É 1912. Afundado em dívidas, Booker DeWitt tem apenas uma chance de limpar seu nome: resgatar Elizabeth, uma garota misteriosa prisionada desde criança na cidade flutuante de Columbia. Obrigados a confiar um no outro, eles precisam dominar um crescente arsenal de armas e habilidades em sua luta para sobreviver às ameaças da cidade e descobrir os seus segredos sombrios.',150.99,245.49,'img/jogo/39jogo.jpg',1);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Yakuza 5','O lendário dragão está de volta ao crime organizado da Yakuza. Kazuma Kiryu, conhecido antes como o Dragão de Dojima, estava vivendo uma vida tranquila como taxista em Hakata depois de se afastar totalmente do mundo do crime. No entanto, no começo da guerra sanguenta entre Tojo Clan e Omi Alliance, Kazuma é forçado a aceitar seu inevitável destino e voltar à vida cheia de crime e violência para proteger as pessoas que ama. Yakuza 5 continua a épica história de Kazuma Kiryu e mais 4 protagonistas: Haruka Sawamura, Taiga Saejima, Tatsuo Shinada e Shun Akiyama. A saga continua nas 5 maiores cidades japonesas: Tóquio, Osaka, Hakata, Nagoya e Sapporo. Yakuza 5 também traz "Another Drama", uma série de tramas secundárias que destaca cada protagonista. Com base nos recursos de Yakuza 4, os sistemas de batalha e de personalização foram melhorados.',45.5,91.9,'img/jogo/40jogo.jpg',1);


INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('TOM CLANCYS THE DIVISION LIMITED EDITION PTBR CPP (NAC-BRA) XONE','Vivemos em um mundo complexo. Quanto mais ele evolui, mais vulnerável fica. Nós criamos um castelo de cartas: retire uma sequer e tudo desmorona. Sexta-feira Negra: uma pandemia devastadora assola Nova York e, um a um, os serviços básicos deixam de funcionar. Em poucos dias, sem comida nem água, a sociedade entra em colapso. The Division, uma unidade autônoma de agentes táticos é ativada. Levando uma vida aparentemente normal entre nós, os agentes da The Division são treinados para agir de forma independente para proteger a sociedade. Enquanto a sociedade declina, nós nos erguemos.',49.9,99.9,'img/jogo/41jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('DARK SOULS II - SCHOLAR OF THE FIRST SIN PTBR CPP (NAC-BRA) XONE BAN','Prepare-se para morrer novamente na experiência completa de Dark Souls II: Scholar of the First Sin.',55.9,119.9,'img/jogo/42jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('JUMP FORCE XBOX ONE','Pela primeira vez na história, os mais famosos heróis dos Mangás serão lançados em um campo de batalha totalmente novo: o nosso mundo. Unidos para lutar contra a maior e mais perigosa ameaça de todas, agora o destino de toda a humanidade está nas mãos da Jump Force.',125.9,249.9,'img/jogo/43jogo.jpeg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('ANTHEM XONE','Anthem™ é um convite para vivenciar um RPG cooperativo de ação ambientado em um mundo novo e misterioso criado pela BioWare™ e pela EA.',125.9,249.9,'img/jogo/44jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('KINGDOM HEARTS III XBOX ONE','KINGDOM HEARTS III O jogo se passa em diversos mundos da Disney e Pixar, seguindo a jornada de Sora um jovem garoto que desconhece o poder espetacular que herdou. ',125.9,249.9,'img/jogo/45jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('RESIDENT EVIL 2 XBOX ONE','Resident Evil 2, a obra-prima que definiu um gênero, está de volta completamente reconstruído do zero para proporcionar uma experiência narrativa mais profunda.',125.9,249.9,'img/jogo/46jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('BATTLEFIELD V XBOX ONE','Entre no maior conflito da humanidade com Battlefield™ V com a série retornando às suas raízes em uma representação nunca antes vista da 2ª Guerra Mundial. Encare a guerra física total no multiplayer com seu pelotão em modos como o vasto Operações Grandiosas e o cooperativo Armas Combinadas, ou testemunhe o sofrimento humano com o combate global em Histórias de Guerra para um jogador.',99.9,199.9,'img/jogo/47jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('JUST DANCE 19 XBOX ONE','Prepare-se para aumentar o volume e libertar o dançarino dentro de você com Just Dance® 2019!',89.9,179.9,'img/jogo/48jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('RED DEAD REDEMPTION 2 XBOX ONE','Estados Unidos, 1899. O fim da era do velho oeste começou, e as autoridades estão caçando as últimas gangues de fora da lei que restam.',159.99,229.9,'img/jogo/49jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('GEARS OF WAR 4','Uma nova saga começa para uma das franquias mais aclamadas na história',110.9,199.9,'img/jogo/50jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('RESIDENT EVIL 7 GOLD EDITION XONE BR','A Capcom confirmou que Resident Evil 7 biohazard Gold Editionchegará às lojas ocidentais e em formato digital no PlayStation 4, Xbox One e PC no dia 12 de dezembro de 2017, mesma data em que serão também disponibilizados os últimos conteúdos adicionais do jogo',80.99,149.9,'img/jogo/51jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('DESTINY 2 PTBR CPP (NAC-BRA) XONE ACT','Novos mundos e ambientes deslumbrantes para explorar com ação, aventura e recompensas desconhecidas. Atividades de jogabilidade para todos os tipos de jogadores. Competitividade PvP Gameplay com novos modos. Personalize seu personagem com nunca. ',45.99,78.9,'img/jogo/52jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('TITANFALL 2 PTBR CPP (NAC-BRA) XONE EA','Titanfall 2 traz um novo capítulo a este intenso Fps sci-fi, aonde pilotos e titãs se unem como nunca antes em batalhas explosivas e acirradas.',44.99,79.9,'img/jogo/53jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('FOR HONOR LIMITED EDITION PTBR CPP (NAC-BRA) XONE UBI','O mundo de For Honor é hostil, mas também recheado com selvas exuberantes, monumentos grandiosos e ruínas majestosas. Seus vigorosos habitantes sobrevivem como podem apesar da vida em estado de guerra perpétua.',80.99,149.9,'img/jogo/54jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('DISHONORED 2 PTBR CPP (NAC-BRA) XONE BET','Reprise seu papel como um assassino sobrenatural em Dishonored 2, esse é o novo capítulo da saga Dishonored  que foi premiado pela Arkane Studios.',150.99,249.9,'img/jogo/55jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('DEAD RISING 3 (BRA) XONE MIC','Explore a cidade infestada de zumbis de Los Perdidos e encontre uma maneira de escapar antes que um ataque militar acabe completamente com toda a cidade.',45.9,70,'img/jogo/56jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CRIMES AND PUNISHMENT - SHERLOCK HOLMES XONE MAX','Dinâmico, refrescante, e cativante, Crimes and Punishments: Sherlock Holmes, você vai assumir o papel de Sherlock Holmes em um ambiente realista e finamente detalhados cheio de criminosos e pistas.',20.99,39.9,'img/jogo/57jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('THE CREW SIGNATURE EDITION PTBR CPP (NAC-BRA) XONE UBI','The Crew é um revolucionário jogo de corrida desenvolvido exclusivamente para a next gen e PCs high-end que aproveita os novos recursos de hardware para conectar jogadores online como nunca visto antes.',59.9,99.9,'img/jogo/58jogo.jpg',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('FAR CRY NEW DAWN - XBOX ONE','O mundo como o conhecemos acabou, mas a história de Hope County está longe de terminar. Dezessete anos após o colapso nuclear global, seus sobreviventes emergiram em um mundo dominado por uma vibrante expansão de vida animal e vegetal, e começaram a construir um novo mundo a partir dos destroços do velho.',99.9,179.91,'img/jogo/59jogo.png',4);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('GRAND THEFT AUTO V ING CPP (NAC-BRA) XONE T2','Edição da aclamada série GTA que conta a história de um personagem que tenta escapar de seu passado, mas é sempre atraído de volta para o crime e a violência.',79.9,117.9,'img/jogo/60jogo.jpg',4);


INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('ASTRAL CHAIN','Prepare-se para um jogo de ação exclusivo, em Astral Chain para Nintendo Switch!Perigosas criaturas aparecem e atacam a Ark, uma cidade multicultural futurista.Faça parte de uma unidade especial da polícia e enfrente essas criaturas alienígenas que invadiram nosso mundo.Escolha seu personagem, junte-se à Legion (uma arma especial que lhe ajudará nessa aventura) e parta para ação!',22.50,45.00,'img/jogo/61jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('BAYONETA','Use armas selvagens e execute movimentos mortais - como o poderoso Umbran Climax - para tirar anjos e demônios neste jogo de ação de tirar o fôlego. Você pode juntar-se com amigos em lutas aéreas on-line ou locais de 2 jogadores.',189.99,349.99,'img/jogo/62jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('DEAD CELLS','Dead Cells é um jogo de plataforma de ação metroidvania. Você vai explorar um castelo imenso e em constante mudança ... assumindo que você é capaz de lutar contra seus guardiões em combates 2D almas-lite. Nenhum ponto de verificação. Mate, morra, aprenda, repita.',60.90,120.00,'img/jogo/63jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Fire Emblem: Three Houses','Encarna o herói de que o mundo precisa em Fire Emblem: Three Houses para a Nintendo Switch!O jogo decorre em Fódlan, onde a Igreja de Seiros exerce um grande poder sobre a terra e os seus habitantes. Na pele da personagem principal, o teu papel é combater no campo de batalha, com total liberdade de movimentos e a possibilidade de interagir com outras personagens para forjar relações e reunir informações.',179.90,256.49,'img/jogo/64jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Fortnite: Deep Freeze Bundle','Fortnite: Deep Freeze Bundle para Nintendo Switch inclui o jogo Fortnite, clássico do modo Battle Royale, e mais conteúdo premium, incluindo o Frostbite Outfit, o Cold Front Glider, o Chill-Axe Pickaxe, o Freezing Point Back Bling e 1.000 V-Bucks, que podem ser usados para compra em itens de jogo, como roupas e o Premium Battle Pass.Em Fortnite Battle Royale, os jogadores se enfrentam e competem para ser o último sobrevivente no modo PvP de 100 jogadores, onde eles construirão coberturas, enfrentarão adversários e sobreviverão por mais tempo para conquistar sua vitória.',79.90,149.99,'img/jogo/65jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Hollow Knight','Na pele do viajante epónimo Hollow Knight, aventura-te pelo vasto labirinto subterrâneo composto por caves, corredores e cidades em ruínas, que incorpora este domínio decadente. Espalhados pelo chão encontram-se os destroços da cidade agora habitada por estranhas e intrigantes criaturas, enquanto que enigmas e tesouros, guardados por criaturas maldosas, aguardam aqueles que têm coragem para se desviar do caminho normal e investigar cada canto e recanto.',29.90,45.90,'img/jogo/66jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Hyrule Harriors','O destino de Hyrule está em suas mãos, reduza todas as hordas, encontre e cuide de todas as fadas que irão te ajudar nas batalhas. Link e Zelda poderão lutar com seus trajes de Legend of Zelda: Breath of the Wild, já Tetra e King Daphnes estão com as roupas de The Legend of Zelda: The Wind Waker. Desta vez você não irá enfrentar a feiticeira Negra e seus carrascos sozinho.',179.90,254.90,'img/jogo/67jogo.jpeg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('L.A. Noire','No meio do auge da era dourada da Hollywood pós-guerra, Cole Phelps, um detetive do departamento de polícia de Los Angeles, cai de cabeça em uma cidade que se afoga no próprio sucesso. A corrupção é generalizada, o tráfico de drogas não para de crescer e o índice de homicídios nunca esteve tão alto. Em sua luta para subir de posição e fazer o que é certo, Phelps deve desvendar a verdade por trás de uma série de incêndios criminosos, conspirações de extorsão e assassinatos brutais, enfrentando o submundo de Los Angeles e até membros do próprio departamento para revelar um segredo que pode abalar as fundações de toda a cidade. ',150.00,279.00,'img/jogo/68jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('MARIO KART 8','Acertar a estrada com a versão definitiva do Mario Kart 8 e jogar a qualquer hora, em qualquer lugar! Corra com seus amigos ou batalhe em um modo de revestido em campos de batalha novos e de retorno. ',169.90,250.79,'img/jogo/69jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('MARIO TENNIS ACES','Um novo jogo de tenis do Mario está trazendo um novo nível de habilidade e competição para o sistema Nintendo Switch. Mario entra na quadra com um traje de tênis elegante para reuniões intensas contra uma variedade de personagens em batalhas de tênis completas. Novas jogabilidades do tênis desafiarão a sua capacidade de ler a posição e o acidente do adversário para determinar qual Shot lhe dará a vantagem. E desta vez o jogo adiciona o modo história desde o jogo de tenis Mario no sistema Game Boy Boy, oferecendo um novo sabor de jogabilidade de tênis, com uma variedade de missões, batalhas patronais e muito mais.',140.90,269.99,'img/jogo/70jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Pokken Tournament DX','Assuma o controle direto de um dos mais de 20 lutadores de Pokémon para vencer outros Pokémon em lutas de arena repletas de ação. Com o Nintendo Switch, você pode lutar em casa ou em movimento para se tornar o campeão da Liga Ferrum! Mostre os novos estilos de luta de Croagunk, Scizor, Empoleon, Darkrai e o recém-adicionado Decidueye. Novos modos permitem que você desafie seus amigos em uma competição intensa. Duele com seus Pokémon Fighters favoritos em Team Battle. Em seguida, grave e faça o upload de suas lutas favoritas com o novo recurso de repetição. Pegue a batalha na estrada com o sistema portátil Nintendo Switch ou encontre a competição online no novo modo de jogo de grupo. Você tem o que é preciso para reivindicar o título do Torneio Dokkun Tournament? Só há uma maneira de descobrir, e é por entrar na arena da batalha!',175.90,299.99,'img/jogo/71jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Puyo-Puyo','Puyo Puyo Tetris traz dois jogos de puzzle clássicos, com um deles sendo o famoso Tetris, que é um dos jogos mais reconhecido da história, além de possuir inúmeros fãs por todo o mundo, e Puyo Puyo, um título original da SEGA. Os dois jogos foram completamente fundidos, gerando um jogo divertido, rápido, competitivo, e completamente inédito, com suporte a um modo multiplayer que comporta até 4 jogadores. Dentre os modos de jogo disponíveis estão o Adventure, que oferece 100 estágios com desafios únicos e múltiplos personagens icônicos da série Puyo Puyo, o Swap, onde os jogadores resolvem puzzles de Puyo Puyo e Tetris simultaneamente, o Big Bang, uma corrida contra o tempo na qual os jogadores competem para limpar totalmente a sua tela, e muitos outros. Nesses modos é possível competir de igual para igual e aumentar a classificação do jogador para ganhar posições e novas ligas.',99.90,144.89,'img/jogo/72jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Rocket League®','Futebol se encontra com corridas nesta mistura ganhadora de prêmios, baseado em física e focado para multi-jogadores sequela do Supersonic Acrobatic Rocket-Powered Battle-Cars! Escolha a partir de uma variedade de veículos voadores equipados com gigantescos impulsionadores de foguete para marcar inacreditáveis gols aéreos e conseguir incríveis, defesas que podem mudar o jogo!',45.90,87.91,'img/jogo/73jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('The Elder Scrolls V: Skyrim','The Elder Scrolls V: Skyrim se destaca pelos cenários colossais e épicos, no melhor estilo medieval possível. No entanto, o título conta com uma nova engine, capaz de entregar gráficos muito melhores do que os vistos em Oblivion e Fallout 3. O trono está vago e sem nenhum imperador para defender, os Blades desaparecem um a um. Como estava escrito nos Pergaminhos Antigos, a guerra em Skyrim é o último passo para o retorno de Alduin, o deus dragão da destruição. Agora, você deve encarar seu destino como o último Dovahkiin, um caçador de dragões ungido pelos deuses para combater a ameaça de Alduin.',45.50,90.00,'img/jogo/74jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Splatoon 2','Splatoon está de volta e agora trazendo muitas novidades, além de agora possuir uma versão para o Nintendo Switch o jogo traz novas armas, novo modo jogo de jogo, multijogador local e online, novos mapas para jogar e as novas modos de jogo. Agora com o Nintendo Switch é possível jogar em qualquer lugar quando você quiser, divirta-se com seus amigos lutando pelo território mais colorido. Splatoon 2 trouxe as Splat Dualies, que são as novas armas duplas, juntamente com a nova jogada Roll - são ideais para desviar de ataques iminente. O jogo também traz o modo Salmon Run, que consiste em unir forças com mais três jogadores para derrotar hordas de salmonídeos. Splatoon continua divertido como nunca, ajude Marie a procurar Callie, no modo para um jogador, escolha sua arma para superar obstáculos e derrotar os “chefões”.',187.45,374.89,'img/jogo/75jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Super Mario Maker 2','Fãs de Mario do mundo, unam-se! Agora você pode jogar, criar e compartilhar os cursos Super Mario ™ dos seus sonhos no Super Mario Maker ™ 2, disponível exclusivamente no sistema Nintendo Switch ™! Mergulhe no Modo de História para um jogador e jogue cursos embutidos para reconstruir o castelo da Princesa Peach. Faça seus próprios cursos, sozinho ou em conjunto. E com uma adesão à Nintendo Switch Online, partilhe os seus cursos, aceda a uma oferta quase infinita feita por outros, desfrute de multijogador online e muito mais!',32.50,59.99,'img/jogo/76jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Super Mario Odyssey','Mario Odyssey é um dos maiores lançamentos da Nintendo este ano, e é por isso que não enviamos nenhum, mas dois editores para jogar o jogo e explicar o que eles achavam da mais nova aventura de plataformas de Mario',199.35,378.67,'img/jogo/77jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('The Legend of Zelda: Breath of the Wild','O jogo conta agora com um estilo em mundo aberto que foge da realidade dos títulos anteriores, e promete muitas inovações no mundo dos games. Na trama, temos a boa e velha estrutura que acompanha a série nos últimos 25 anos, a luta de Link para proteger a Princesa Zelda e, de quebra, salvar o reino, e mecânicas de jogabilidade completamente novas.',140.90,279.90,'img/jogo/78jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Xenoblade Chronicles 2','Enquanto estes monstros gigantescos caminham para a morte, a última esperança é um caçador de tesouros chamado Rex e Pyra, uma arma viva conhecida como uma Blade. Será que você consegue encontrar o paraíso lendário que ela chama de lar? Comande um grupo de Blades e os guie a incontáveis vitórias estratégicas, antes que o mundo acabe. Percorra vastas áreas abertas e corredores labirínticos em busca de tesouros, caminhos secretos e criaturas para lutar e catalogar',159.90,229.99,'img/jogo/79jogo.jpg',7);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('Yoshis Crafted World','Prepare-se para se aventurar com o Yoshi no seu Nintendo Switch, numa nova missão que irá mudar tudo que você conhece em termos de jogos de plataforma! Explore um gigante mundo, feito com todos os detalhes e qualidade da Nintendo em um novo estilo de arte, cheio de surpresas e itens secretos. É possível jogar sozinho ou chamar seu amigo para o modo co-op nessa trama que possui mundos normais e caminhos escondidos. ',129.90,249.99,'img/jogo/80jogo.jpg',7);


INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE PS4 500GB SLIM PRETO','O PS4 SLIM possui um design menor, economia de energia e um novo dual shock 4 o sistema Playstation 4 é o melhor lugar para jogar com dinâmica, jogos conectados, velocidade e gráficos poderosos, personalização inteligente, capacidades sociais profundamente integradas e funções inovadoras de tela secundária. O sistema do PS4 foca nos jogadores, garantindo que os melhores jogos e a experiência mais imersiva seja possível na plataforma. O PS4 é centrado em um poderoso chip personalizado que contém oito núcleos x86-64 e um tecnológico processador gráfico 1.84 tflops com um sistema unificado de memória gddr5 ultra rápido de 8GB, facilitando a criação de jogos e aumentando a riqueza de conteúdo possível na plataforma.',1870.30,2149.90,'img/console/1console.jpeg',3);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE PS4 1 TERA PRETO','O PlayStation®4 é o melhor lugar para jogar jogos dinâmicos e conectados, com gráfico rico e alta velocidade, personalização inteligente, funcionalidades sociais altamente integradas combinando conteúdo sem igual, experiências de jogo envolventes, todos os seus aplicativos favoritos de entretenimento digital e as exclusividades do playstation, o ps4 é centrado nos jogadores, permitindo-lhes que joguem quando, onde e como quiserem. O PS4 permite que os melhores desenvolvedores de jogos do mundo liberem sua criatividade e estendam os limites do jogo por meio de um sistema que está sintonizado especificamente com suas necessidades.',1980.40,2299.90,'img/console/2console.jpg',3);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE PS4 1 TERA BRANCO','O PlayStation®4 é o melhor lugar para jogar jogos dinâmicos e conectados, com gráfico rico e alta velocidade, personalização inteligente, funcionalidades sociais altamente integradas combinando conteúdo sem igual, experiências de jogo envolventes, todos os seus aplicativos favoritos de entretenimento digital e as exclusividades do playstation, o ps4 é centrado nos jogadores, permitindo-lhes que joguem quando, onde e como quiserem. O PS4 permite que os melhores desenvolvedores de jogos do mundo liberem sua criatividade e estendam os limites do jogo por meio de um sistema que está sintonizado especificamente com suas necessidades.',1950.30,2254.20,'img/console/3console.jpg',3);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE PS4 500GB SLIM BRANCO','O PS4 SLIM possui um design menor, economia de energia e um novo dual shock 4 o sistema Playstation 4 é o melhor lugar para jogar com dinâmica, jogos conectados, velocidade e gráficos poderosos, personalização inteligente, capacidades sociais profundamente integradas e funções inovadoras de tela secundária. O sistema do PS4 foca nos jogadores, garantindo que os melhores jogos e a experiência mais imersiva seja possível na plataforma. O PS4 é centrado em um poderoso chip personalizado que contém oito núcleos x86-64 e um tecnológico processador gráfico 1.84 tflops com um sistema unificado de memória gddr5 ultra rápido de 8GB, facilitando a criação de jogos e aumentando a riqueza de conteúdo possível na plataforma.',1890.20,2029.50,'img/console/4console.jpg',3);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE PS4 1 TERA DOURADO','O PlayStation®4 é o melhor lugar para jogar jogos dinâmicos e conectados, com gráfico rico e alta velocidade, personalização inteligente, funcionalidades sociais altamente integradas combinando conteúdo sem igual, experiências de jogo envolventes, todos os seus aplicativos favoritos de entretenimento digital e as exclusividades do playstation, o ps4 é centrado nos jogadores, permitindo-lhes que joguem quando, onde e como quiserem. O PS4 permite que os melhores desenvolvedores de jogos do mundo liberem sua criatividade e estendam os limites do jogo por meio de um sistema que está sintonizado especificamente com suas necessidades.',1950.30,2252.20,'img/console/5console.jpg',3);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE PS4 500GB SLIM DOURADO','O PS4 SLIM possui um design menor, economia de energia e um novo dual shock 4 o sistema Playstation 4 é o melhor lugar para jogar com dinâmica, jogos conectados, velocidade e gráficos poderosos, personalização inteligente, capacidades sociais profundamente integradas e funções inovadoras de tela secundária. O sistema do PS4 foca nos jogadores, garantindo que os melhores jogos e a experiência mais imersiva seja possível na plataforma. O PS4 é centrado em um poderoso chip personalizado que contém oito núcleos x86-64 e um tecnológico processador gráfico 1.84 tflops com um sistema unificado de memória gddr5 ultra rápido de 8GB, facilitando a criação de jogos e aumentando a riqueza de conteúdo possível na plataforma.',1890.20,2024.50,'img/console/6console.jpg',3);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE PS3 320GB PRETO','O PlayStation 3 é um console muito popular que foi desenvolvido pela Sony. O videogame possui três versões: o PS3, o PS3 Slim e o PS3 Super Slim. A versão mais econômica é o PlayStation 3 Slim, tanto em tamanho quanto em preço e consumo de energia. PS3 Slim vem com o já consagrado controle DualShock 3 wireless - funciona sem fio com excelente autonomia da sua bateria. ',1020.30,1495.30,'img/console/7console.jpg',3);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE XBOX ONE X 1TB PRETO','O Xbox One traz um cooler posicionado diretamente sobre o enorme dissipador de calor montado sobre a APU, exatamente como acontece no modelo Slim do 360. Com isso, a empresa garante um sistema de refrigeração mais seguro para o console',1930.20,2299.45,'img/console/8console.jpg',6);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE XBOX ONE S 1TB BRANCO','O Xbox One traz um cooler posicionado diretamente sobre o enorme dissipador de calor montado sobre a APU, exatamente como acontece no modelo Slim do 360. Com isso, a empresa garante um sistema de refrigeração mais seguro para o console',1302.15,1852.40,'img/console/9console.jpg',6);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE XBOX ONE X 500GB PRETO','O Xbox One traz um cooler posicionado diretamente sobre o enorme dissipador de calor montado sobre a APU, exatamente como acontece no modelo Slim do 360. Com isso, a empresa garante um sistema de refrigeração mais seguro para o console',1890.20,2029.50,'img/console/10console.jpg',6);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE XBOX ONE X 1TB BRANCO','O Xbox One traz um cooler posicionado diretamente sobre o enorme dissipador de calor montado sobre a APU, exatamente como acontece no modelo Slim do 360. Com isso, a empresa garante um sistema de refrigeração mais seguro para o console',1930.20,2299.45,'img/console/11console.jpg',6);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE NINTENDO SWITCH 32GB','O Nintendo Switch, é seu mais recente lançamento e une em um único console, a qualidade gráfica de uma plataforma de mesa, com a versatilidade de um portátil. O Nintendo Switch, apresenta ao jogador uma inédita experiência no universo dos games. Suas características modulares é o grande destaque desse novo console, seus Joy-Con são acoplados ou removidos com muita facilidade, o que possibilita muitas maneiras de jogar.',2200.00,2899.50,'img/console/12console.jpg',9);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONSOLE NINTENDO SWITCH 230GB','O Nintendo Switch, é seu mais recente lançamento e une em um único console, a qualidade gráfica de uma plataforma de mesa, com a versatilidade de um portátil. O Nintendo Switch, apresenta ao jogador uma inédita experiência no universo dos games. Suas características modulares é o grande destaque desse novo console, seus Joy-Con são acoplados ou removidos com muita facilidade, o que possibilita muitas maneiras de jogar.',1700.60,1952.60,'img/console/13console.jpg',9);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('HEADSET PC/PS4/PS3','Headset Fone Stéreo Microfone Ps3 Ps4 Pc FR-215',35.00,59.90,'img/acessorio/1acessorio.jpg',2);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONTROLE PS4 SEM FIO DUALSHOK VERMELHO SONY','Novas maneiras de jogar: Recursos revolucionários como o touch pad, barra de luz integrada e alto-falante embutido oferecem novas e emocionantes maneiras de experimentar e interagir com seus jogos e sua tomada de áudio de 3,5 mm oferece uma solução prática de áudio pessoal para os jogadores que querem ouvir seus jogos em privado',150.00,249.90,'img/acessorio/2acessorio.jpg',2);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('CONTROLE DUALSHOCK PLAYSTATION 4 WIRELESS','O Controle Sem Fio Playstation 4 Dualshock É Perfeito Para Os Gamers Mais Exigentes',190.00,319.9,'img/acessorio/3acessorio.jpg',2);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('SKIN CONTROLE PS4 CARBONO PRETO RESIDENT EVIL 7','Agora você consegue personalizar o seu Controle Dualshock 4 com esse incrível adesivo de vinil com alto acabamento. E melhor, caso deseje remover o adesivo posteriormente fique tranquilo pois ele não deixará resíduos.',5.0,19.90,'img/acessorio/4acessorio.png',2);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('PS4 MOCHILA PLAYSTATION 4','Mochila PS4',10.00,39.90,'img/acessorio/5acessorio.jpg',2);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('ÓCULOS PLAYSTATION VR + GRAN TURISMO SPORT + CÂMERA - BUNDLE PS4','Coloque-se no banco do motorista com o Gran Turismo Sport na PlayStation VR e desafie-se na melhor experiência de corrida. Experimente corridas de maneiras novas e extraordinárias. Vire a cabeça e aponte para o ápice enquanto entra no canto. Confiantemente acelerar enquanto você olha para frente na saída para um canto cego. O futuro do automobilismo é o PlayStation VR. Seu coração vai correr. Seus pupilos se dilatam.',1436.00,1899.90,'img/acessorio/6acessorio.jpg',2);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('X BOX ONE MOCHILA','Mochila XBOX ONE',25.30,49.90,'img/acessorio/7acessorio.jpg',5);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('SKIN CONTROLE XONE CARBONO PRETO RESIDENT EVIL 7','Agora você consegue personalizar o seu Controle de Xbox One com esse incrível adesivo de vinil com alto acabamento. E melhor, caso deseje remover o adesivo posteriormente fique tranquilo pois ele não deixará resíduos.',5.00,19.90,'img/acessorio/8acessorio.png',5);
INSERT INTO produto ( pro_nome,pro_descricao,pro_preco_compra,pro_preco_venda,pro_url_foto,pro_cat_id) VALUES ('SMARTCHUCK WII BRANCO','Controle Nunchuck Para Nintendo Wii Branco O Controle Nunchuck Serve De Expansão Para Wii Remote Aumentando Suas Possibilidades E Jogabilidade No Nintendo Wii. Possui A Mesma Tecnologia Do Wii Remote, Mais Inclui Também, Um Controle Direcional Analógico Para Auxiliar Nos Movimentos De Personagens Em Jogos.',15.00,49.90,'img/acessorio/9acessorio.jpg',8);



--vendas
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (500, '2018/01/15', 2000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (501, '2018/02/15', 5000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (502, '2018/03/15', 5000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (503, '2018/04/15', 5000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (504, '2018/05/15', 5000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (505, '2018/06/15', 5000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (506, '2018/07/15', 2000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (507, '2018/08/15', 5000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (508, '2018/09/15', 5000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (509, '2018/10/15', 5000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (510, '2018/11/15', 5000, 1);
INSERT INTO public.tb_venda(
	ven_id, ven_data, ven_total, ven_usu_id)
	VALUES (511, '2018/12/15', 5000, 1);


--itens
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (500, 1);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (500, 1);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (500, 2);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (500, 3);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (500, 3);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (500, 3);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (500, 3);
	
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (501, 10);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (501, 10);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (501, 12);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (501, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (501, 11);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (501, 15);
	
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (502, 10);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (502, 10);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (502, 12);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (502, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (502, 11);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (502, 15);
	
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 40);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 13);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 80);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 40);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 13);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (503, 80);
	
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (504, 13);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (504, 80);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (504, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (504, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (504, 40);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (504, 22);

INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (505, 10);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (505, 10);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (505, 12);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (505, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (505, 11);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (505, 15);
	
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (506, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (506, 40);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (506, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (506, 13);

INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (507, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (507, 40);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (507, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (507, 13);

INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (508, 80);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (508, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (508, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (508, 40);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (508, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (508, 13);
	
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (509, 80);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (509, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (509, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (509, 40);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (509, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (509, 13);
	
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (510, 80);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (510, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (510, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (510, 40);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (510, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (510, 13);
	
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (511, 80);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (511, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (511, 25);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (511, 40);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (511, 22);
INSERT INTO public.tb_itens_venda(
	 itens_ven_id, itens_pro_id)
	VALUES (511, 13);

