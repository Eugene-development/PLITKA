<script>
	const stats = [
		{ value: '15+', label: 'Лет на рынке' },
		{ value: '50+', label: 'Брендов-партнёров' },
		{ value: '12 000+', label: 'Артикулов в каталоге' },
		{ value: '20+', label: 'Городов доставки' },
		{ value: '98%', label: 'Довольных клиентов' }
	];

	const values = [
		{
			icon: '🏛️',
			title: 'Экспертиза',
			desc: 'Более 15 лет на рынке отделочных материалов. Наши специалисты знают о плитке всё — от свойств материалов до тонкостей укладки.'
		},
		{
			icon: '🌍',
			title: 'Лучшие производители',
			desc: 'Прямые контракты с ведущими заводами Италии, Испании, Португалии и России. Никаких посредников — только оригинальная продукция.'
		},
		{
			icon: '✨',
			title: 'Честность',
			desc: 'Мы показываем реальные цены, настоящие фотографии и честные характеристики. Никаких скрытых наценок.'
		},
		{
			icon: '🤝',
			title: 'Долгосрочные отношения',
			desc: 'Большинство наших клиентов возвращаются снова. Мы выстраиваем отношения, а не просто продаём плитку.'
		}
	];

	const milestones = [
		{
			year: '2009',
			title: 'Основание компании',
			desc: 'Начали с небольшого шоурума в Москве с 500 артикулами в ассортименте.'
		},
		{
			year: '2013',
			title: 'Прямые поставки',
			desc: 'Заключили первые прямые контракты с итальянскими производителями, снизив цены на 30%.'
		},
		{
			year: '2017',
			title: 'Онлайн-каталог',
			desc: 'Запустили первый в России онлайн-каталог плитки с 3D-визуализацией.'
		},
		{
			year: '2021',
			title: 'Партнёрская сеть',
			desc: 'Открыли сеть партнёрских салонов в 20+ городах по всей России.'
		},
		{
			year: '2024',
			title: 'PLITKA сегодня',
			desc: '12 000+ артикулов, 50+ брендов, собственная служба доставки и 3D-дизайна.'
		}
	];

	const team = [
		{
			name: 'Александр Петров',
			role: 'Основатель и CEO',
			bio: '20 лет в строительной отрасли. Влюблён в итальянский дизайн и архитектуру.'
		},
		{
			name: 'Мария Козлова',
			role: 'Главный дизайнер',
			bio: 'Архитектор с опытом работы в Милане. Ведёт более 200 дизайн-проектов в год.'
		},
		{
			name: 'Дмитрий Соколов',
			role: 'Директор по закупкам',
			bio: 'Переговорщик с 15-летним опытом работы с европейскими производителями.'
		}
	];

	const brands = [
		'Kerama Marazzi',
		'Atlas Concorde',
		'Italon',
		'Laparet',
		'Cersanit',
		'Estima',
		'Gracia',
		'Cerrad'
	];
</script>

<svelte:head>
	<title>PLITKA — О нас</title>
	<meta
		name="description"
		content="История компании PLITKA — 15 лет экспертизы в области плитки, прямые поставки от лучших мировых производителей, команда профессионалов."
	/>
</svelte:head>

<!-- ===== HERO ===== -->
<section class="relative flex min-h-[55vh] items-center overflow-hidden">
	<div
		class="absolute inset-0 bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>
	<!-- Glow blobs -->
	<div class="absolute top-1/2 left-1/3 -translate-x-1/2 -translate-y-1/2">
		<div class="size-[600px] rounded-full bg-accent-500/6 blur-3xl"></div>
	</div>
	<div class="absolute right-0 bottom-0 translate-x-1/4 translate-y-1/4">
		<div class="size-[400px] rounded-full bg-accent-600/5 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-accent-500/20 bg-accent-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-accent-500"></span>
			<span class="text-xs font-semibold tracking-wider text-accent-500 uppercase"
				>Наша история</span
			>
		</div>
		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			О компании
			<br />
			<span class="bg-gradient-to-r from-accent-500 to-accent-300 bg-clip-text text-transparent">
				PLITKA
			</span>
		</h1>
		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Мы помогаем создавать красивые интерьеры уже 15 лет. Прямые поставки от лучших мировых
			производителей, честные цены и экспертиза на каждом шагу.
		</p>

		<!-- Mini stats row -->
		<div class="mt-14 flex flex-wrap gap-10 border-t border-surface-700/50 pt-8">
			{#each stats as stat (stat.label)}
				<div>
					<div class="font-display text-2xl font-bold text-accent-500">{stat.value}</div>
					<div class="mt-1 text-xs tracking-wide text-surface-300">{stat.label}</div>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== MISSION SECTION ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<div class="grid items-center gap-12 lg:grid-cols-2 lg:gap-20">
			<!-- Left: text -->
			<div>
				<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
					Наша миссия
				</span>
				<h2
					class="mt-4 font-display text-4xl leading-tight font-bold tracking-wide text-white lg:text-5xl"
				>
					Красота в каждом <span class="text-surface-300">квадратном метре</span>
				</h2>
				<p class="mt-6 text-lg leading-relaxed text-surface-300">
					PLITKA появилась из простой идеи: каждый человек заслуживает красивого дома, а красивый
					дом начинается с правильных материалов. Мы убрали лишних посредников, наладили прямые
					поставки и собрали команду настоящих экспертов.
				</p>
				<p class="mt-4 leading-relaxed text-surface-300">
					Сегодня мы работаем с частными клиентами, дизайнерами и застройщиками по всей России. Наш
					принцип неизменен: предлагать лучшее качество по честной цене и помогать на каждом этапе —
					от выбора до укладки.
				</p>
			</div>

			<!-- Right: quote card -->
			<div class="relative">
				<div
					class="relative rounded-3xl border border-surface-700/50 bg-surface-800/50 p-10 backdrop-blur-sm"
				>
					<div
						class="absolute -top-px left-10 h-px w-20 bg-gradient-to-r from-transparent via-accent-500 to-transparent"
					></div>
					<div class="mb-6 font-display text-6xl leading-none text-accent-500/20">"</div>
					<blockquote class="font-display text-2xl leading-snug font-semibold text-white">
						Плитка — это не просто материал. Это основа атмосферы, которую вы создаёте в своём доме.
					</blockquote>
					<div class="mt-8 flex items-center gap-4">
						<div
							class="flex size-12 items-center justify-center rounded-full border border-accent-500/30 bg-accent-500/10 font-display text-lg font-bold text-accent-500"
						>
							АП
						</div>
						<div>
							<div class="text-sm font-semibold text-white">Александр Петров</div>
							<div class="text-xs text-surface-300">Основатель компании PLITKA</div>
						</div>
					</div>
				</div>
				<!-- Floating accent square -->
				<div
					class="absolute -right-4 -bottom-4 size-24 rounded-2xl border border-accent-500/10 bg-accent-500/5"
				></div>
			</div>
		</div>
	</div>
</section>

<!-- ===== VALUES SECTION ===== -->
<section class="relative bg-surface-800/30 py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<div class="mb-16 text-center">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
				Наши принципы
			</span>
			<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
				На чём держится PLITKA
			</h2>
		</div>

		<div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
			{#each values as val (val.title)}
				<div
					class="group rounded-2xl border border-surface-700/50 bg-surface-800/30 p-8 transition-all duration-500 hover:border-accent-500/20 hover:bg-surface-800/60"
				>
					<div class="mb-5 text-4xl">{val.icon}</div>
					<h3 class="text-lg font-bold text-white">{val.title}</h3>
					<p class="mt-3 text-sm leading-relaxed text-surface-300">{val.desc}</p>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== TIMELINE SECTION ===== -->
<section class="relative py-24 lg:py-32">
	<!-- Glow -->
	<div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
		<div class="size-[700px] rounded-full bg-accent-500/4 blur-3xl"></div>
	</div>

	<div class="relative px-10 lg:px-24 xl:px-32">
		<div class="mb-16 text-center">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
				Хронология
			</span>
			<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
				Как мы росли
			</h2>
		</div>

		<div class="relative mx-auto max-w-3xl">
			<!-- Vertical line -->
			<div
				class="absolute top-0 bottom-0 left-6 w-px bg-gradient-to-b from-accent-500/50 via-accent-500/20 to-transparent lg:left-1/2 lg:-translate-x-1/2"
			></div>

			<div class="flex flex-col">
				{#each milestones as item, i (item.year)}
					<div
						class="relative flex items-start gap-6 pb-12 lg:pb-16 {i % 2 === 0
							? 'lg:flex-row'
							: 'lg:flex-row-reverse'} lg:gap-0"
					>
						<!-- Dot -->
						<div
							class="relative z-10 shrink-0 lg:absolute lg:top-1 lg:left-1/2 lg:-translate-x-1/2"
						>
							<div
								class="flex size-12 items-center justify-center rounded-full border border-accent-500/40 bg-surface-900 shadow-lg shadow-black/50"
							>
								<div class="size-3 rounded-full bg-accent-500"></div>
							</div>
						</div>

						<!-- Card -->
						<div class="flex-1 lg:mx-8 lg:max-w-[calc(50%-3rem)]">
							<div
								class="group rounded-2xl border border-surface-700/50 bg-surface-800/40 p-6 transition-all duration-300 hover:border-accent-500/20 hover:bg-surface-800/70"
							>
								<span class="font-display text-3xl font-bold text-accent-500">{item.year}</span>
								<h3 class="mt-2 text-base font-bold text-white">{item.title}</h3>
								<p class="mt-2 text-sm leading-relaxed text-surface-300">{item.desc}</p>
							</div>
						</div>

						<!-- Empty spacer for alternating layout -->
						<div class="hidden flex-1 lg:block"></div>
					</div>
				{/each}
			</div>
		</div>
	</div>
</section>

<!-- ===== TEAM SECTION ===== -->
<section class="relative overflow-hidden bg-surface-800/30 py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<div class="mb-16 text-center">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">Люди</span>
			<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
				Команда PLITKA
			</h2>
			<p class="mx-auto mt-4 max-w-xl text-surface-300">
				За каждым заказом стоит команда профессионалов, которые искренне любят своё дело.
			</p>
		</div>

		<div class="grid grid-cols-1 gap-6 sm:grid-cols-3">
			{#each team as member (member.name)}
				<div
					class="group rounded-2xl border border-surface-700/50 bg-surface-800/40 p-8 text-center transition-all duration-500 hover:border-accent-500/20 hover:bg-surface-800/70 hover:shadow-2xl hover:shadow-accent-500/5"
				>
					<!-- Avatar initials -->
					<div
						class="mx-auto mb-6 flex size-20 items-center justify-center rounded-full border border-accent-500/20 bg-gradient-to-br from-accent-500/20 to-accent-600/5 font-display text-2xl font-bold text-accent-500 transition-all duration-300 group-hover:border-accent-500/40"
					>
						{member.name
							.split(' ')
							.map((n) => n[0])
							.join('')}
					</div>
					<h3 class="text-lg font-bold text-white">{member.name}</h3>
					<div class="mt-1 text-xs font-semibold tracking-wider text-accent-500 uppercase">
						{member.role}
					</div>
					<p class="mt-4 text-sm leading-relaxed text-surface-300">{member.bio}</p>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== BRANDS SECTION ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<div class="mb-16 text-center">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
				Наши партнёры
			</span>
			<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
				Бренды, которым мы доверяем
			</h2>
			<p class="mx-auto mt-4 max-w-xl text-surface-300">
				Прямые контракты с ведущими производителями — гарантия оригинальности и лучших цен.
			</p>
		</div>

		<div class="grid grid-cols-2 gap-4 sm:grid-cols-4 lg:grid-cols-8">
			{#each brands as brand (brand)}
				<div
					class="flex h-16 items-center justify-center rounded-xl border border-surface-700/50 bg-surface-800/30 px-4 text-xs font-semibold tracking-wide text-surface-300 transition-all duration-300 hover:border-accent-500/20 hover:text-surface-200"
				>
					{brand}
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== CTA SECTION ===== -->
<section class="relative overflow-hidden py-24 lg:py-32">
	<div
		class="absolute inset-0 bg-gradient-to-br from-accent-600/20 via-surface-900 to-surface-900"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.04]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 40px 40px;"
	></div>

	<div class="relative px-8 text-center lg:px-16 xl:px-20">
		<h2 class="font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
			Готовы начать вместе?
		</h2>
		<p class="mx-auto mt-6 max-w-xl text-lg text-surface-300">
			Свяжитесь с нами — поможем подобрать идеальную плитку, рассчитаем количество и сделаем
			3D-визуализацию бесплатно.
		</p>
		<div class="mt-10 flex flex-wrap items-center justify-center gap-4">
			<a
				href="/catalog"
				class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
			>
				Смотреть каталог
				<svg viewBox="0 0 20 20" class="size-4 fill-current">
					<path
						fill-rule="evenodd"
						d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
						clip-rule="evenodd"
					/>
				</svg>
			</a>
			<a
				href="/contacts"
				class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
			>
				Связаться с нами
			</a>
		</div>
	</div>
</section>
