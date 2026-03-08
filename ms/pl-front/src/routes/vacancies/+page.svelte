<script>
	let activeVacancy = $state(null);
	let formName = $state('');
	let formPhone = $state('');
	let submitted = $state(false);
	let loading = $state(false);

	const vacancies = [
		{
			id: 'tiler',
			title: 'Плиточник',
			type: 'Полная занятость',
			location: 'Москва и МО',
			salary: 'от 90 000 ₽',
			icon: `<path d="M3 3h7v7H3zM14 3h7v7h-7zM3 14h7v7H3zM14 14h7v7h-7z" stroke-linecap="round" stroke-linejoin="round"/>`,
			description:
				'Занимаемся профессиональной укладкой плитки в жилых и коммерческих объектах. Ищем профессионала с безупречным качеством работы.',
			duties: [
				'Укладка настенной и напольной плитки, керамогранита и мозаики',
				'Подготовка поверхностей (штукатурка, выравнивание, гидроизоляция)',
				'Работа с погонажем, порогами и декоративными элементами',
				'Соблюдение строительных норм и стандартов качества PLITKA'
			],
			requirements: [
				'Опыт укладки плитки от 3 лет',
				'Умение работать с крупноформатными плитами (60×120 и более)',
				'Знание технологий: фоновая укладка, диагональ, паркетный шов',
				'Аккуратность, ответственность, работа в команде'
			]
		},
		{
			id: 'sales',
			title: 'Менеджер по продажам',
			type: 'Полная занятость',
			location: 'Москва, офис / гибрид',
			salary: 'от 70 000 ₽ + бонусы',
			icon: `<path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75" stroke-linecap="round" stroke-linejoin="round"/>`,
			description:
				'Продажи — сердце нашего бизнеса. Мы ищем энергичного консультанта, который умеет слушать клиентов и подбирать решения, меняющие пространство.',
			duties: [
				'Консультирование клиентов в шоуруме и по телефону / мессенджерам',
				'Подбор коллекций плитки под проект и бюджет клиента',
				'Работа с дизайнерами, прорабами и частными заказчиками',
				'Ведение CRM, выставление счетов, контроль отгрузки'
			],
			requirements: [
				'Опыт продаж в сфере строительных материалов или интерьера от 1 года',
				'Умение работать с возражениями и вести переговоры',
				'Знание 1С или amoCRM будет плюсом',
				'Грамотная речь, презентабельный внешний вид'
			]
		},
		{
			id: 'designer',
			title: 'Дизайнер мебели',
			type: 'Полная занятость / Проектная работа',
			location: 'Москва, гибридный формат',
			salary: 'от 80 000 ₽',
			icon: `<path d="M12 20h9M16.5 3.5a2.121 2.121 0 013 3L7 19l-4 1 1-4L16.5 3.5z" stroke-linecap="round" stroke-linejoin="round"/>`,
			description:
				'Создаём интерьеры, в которых плитка и мебель дополняют друг друга. Ищем дизайнера, способного мыслить пространством и деталями одновременно.',
			duties: [
				'Разработка концепций меблировки для жилых и коммерческих интерьеров',
				'Создание 3D-визуализаций в сочетании с нашими коллекциями плитки',
				'Подбор мебели, освещения и декора под проект',
				'Сопровождение проекта от эскиза до монтажа'
			],
			requirements: [
				'Профессиональное образование в области дизайна интерьеров или смежных специальностей',
				'Уверенное владение 3ds Max / SketchUp / Revit, Photoshop',
				'Портфолио выполненных проектов — обязательно',
				'Знание актуальных тенденций в интерьерном дизайне'
			]
		},
		{
			id: 'curator',
			title: 'Куратор проектов',
			type: 'Полная занятость',
			location: 'Москва и МО',
			salary: 'от 85 000 ₽',
			icon: `<path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2M9 12l2 2 4-4" stroke-linecap="round" stroke-linejoin="round"/>`,
			description:
				'Координируем ремонтные проекты от замера до сдачи объекта. Ищем человека, который умеет держать всё под контролем и общается с клиентами на одном языке.',
			duties: [
				'Координация взаимодействия между клиентами, дизайнерами и бригадами монтажников',
				'Составление и ведение проектных планов, контроль сроков и бюджетов',
				'Выезд на объекты для приёмки работ и консультаций',
				'Решение оперативных вопросов и работа с рекламациями'
			],
			requirements: [
				'Опыт управления строительными или ремонтными проектами от 2 лет',
				'Умение работать в режиме многозадачности',
				'Знание строительных технологий и материалов',
				'Навыки работы с проектной документацией, MS Project или аналогами'
			]
		}
	];

	function openVacancy(id) {
		activeVacancy = activeVacancy === id ? null : id;
	}

	async function handleApply(e) {
		e.preventDefault();
		loading = true;
		await new Promise((r) => setTimeout(r, 1200));
		loading = false;
		submitted = true;
	}

	function resetForm() {
		formName = '';
		formPhone = '';
		submitted = false;
		activeVacancy = null;
	}
</script>

<svelte:head>
	<title>PLITKA — Вакансии</title>
	<meta
		name="description"
		content="Работайте вместе с PLITKA — открытые вакансии: Плиточник, Менеджер по продажам, Дизайнер мебели, Куратор проектов."
	/>
</svelte:head>

<!-- ===== HERO ===== -->
<section class="relative flex min-h-[50vh] items-center overflow-hidden">
	<!-- Background -->
	<div
		class="absolute inset-0 bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>
	<!-- Glow -->
	<div class="absolute top-1/2 right-1/4 translate-x-1/2 -translate-y-1/2">
		<div class="size-[500px] rounded-full bg-accent-500/8 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-accent-500/20 bg-accent-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-accent-500"></span>
			<span class="text-xs font-semibold tracking-wider text-accent-500 uppercase"
				>Команда PLITKA</span
			>
		</div>
		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			Вакансии
		</h1>
		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Мы строим команду профессионалов, которым важно качество. Присоединяйтесь —
			<span class="font-semibold text-accent-500">вместе создаём пространства</span>, которыми
			гордятся.
		</p>
	</div>
</section>

<!-- ===== VACANCIES ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Section header -->
		<div class="mb-16">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
				Открытые позиции
			</span>
			<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
				{vacancies.length} вакансии <span class="text-surface-300">прямо сейчас</span>
			</h2>
			<p class="mt-4 max-w-2xl text-surface-300">
				Нажмите на карточку, чтобы узнать подробности об обязанностях и требованиях. Откликнитесь
				прямо на странице.
			</p>
		</div>

		<!-- Vacancy cards -->
		<div class="flex flex-col gap-4">
			{#each vacancies as vacancy (vacancy.id)}
				<!-- Card -->
				<div
					class="group rounded-2xl border border-surface-700/50 bg-surface-800/40 transition-all duration-500 hover:border-accent-500/30 hover:bg-surface-800/70"
				>
					<!-- Card header — always visible -->
					<button
						class="flex w-full items-center gap-6 p-6 text-left lg:p-8"
						onclick={() => openVacancy(vacancy.id)}
						aria-expanded={activeVacancy === vacancy.id}
					>
						<!-- Icon -->
						<div
							class="flex size-14 shrink-0 items-center justify-center rounded-xl border border-accent-500/20 bg-accent-500/10 transition-all duration-300 group-hover:border-accent-500/50 group-hover:bg-accent-500/15"
						>
							<svg
								viewBox="0 0 24 24"
								class="size-6 fill-none stroke-accent-500 stroke-2"
								stroke-linecap="round"
								stroke-linejoin="round"
							>
								{@html vacancy.icon}
							</svg>
						</div>

						<!-- Main info -->
						<div class="min-w-0 flex-1">
							<h3 class="text-xl font-bold text-white">{vacancy.title}</h3>
							<div class="mt-2 flex flex-wrap items-center gap-x-5 gap-y-1.5">
								<span class="flex items-center gap-1.5 text-sm text-surface-300">
									<svg viewBox="0 0 16 16" class="size-3.5 shrink-0 fill-accent-500/70">
										<path
											fill-rule="evenodd"
											d="M8 1a4.5 4.5 0 100 9 4.5 4.5 0 000-9zM2.5 5.5a5.5 5.5 0 1111 0 5.5 5.5 0 01-11 0zm4.95 5.854a6.5 6.5 0 013.1 0A8.001 8.001 0 0115 15H1a8.001 8.001 0 014.45-3.646z"
											clip-rule="evenodd"
										/>
									</svg>
									{vacancy.type}
								</span>
								<span class="flex items-center gap-1.5 text-sm text-surface-300">
									<svg viewBox="0 0 16 16" class="size-3.5 shrink-0 fill-accent-500/70">
										<path
											d="M8 1a5.5 5.5 0 100 11A5.5 5.5 0 008 1zm0 10.5a5 5 0 110-10 5 5 0 010 10z"
										/>
										<path d="M8 5a3.5 3.5 0 100 7 3.5 3.5 0 000-7z" />
									</svg>
									{vacancy.location}
								</span>
							</div>
						</div>

						<!-- Salary + chevron -->
						<div class="flex shrink-0 items-center gap-6">
							<span class="hidden text-base font-semibold text-accent-500 sm:block">
								{vacancy.salary}
							</span>
							<div
								class="flex size-9 items-center justify-center rounded-full border border-surface-600 bg-surface-700 transition-all duration-300 group-hover:border-accent-500/40 group-hover:bg-surface-600"
							>
								<svg
									viewBox="0 0 16 16"
									class="size-4 fill-none stroke-surface-300 stroke-2 transition-transform duration-300 {activeVacancy ===
									vacancy.id
										? 'rotate-180'
										: ''}"
									stroke-linecap="round"
									stroke-linejoin="round"
								>
									<path d="M4 6l4 4 4-4" />
								</svg>
							</div>
						</div>
					</button>

					<!-- Expandable details -->
					{#if activeVacancy === vacancy.id}
						<div class="border-t border-surface-700/50 px-6 pt-6 pb-8 lg:px-8">
							<!-- Salary mobile -->
							<p class="mb-6 text-sm font-semibold text-accent-500 sm:hidden">
								Зарплата: {vacancy.salary}
							</p>

							<p class="mb-8 leading-relaxed text-surface-300">{vacancy.description}</p>

							<div class="grid gap-8 lg:grid-cols-2">
								<!-- Duties -->
								<div>
									<h4 class="mb-4 text-sm font-semibold tracking-wider text-surface-50 uppercase">
										Обязанности
									</h4>
									<ul class="flex flex-col gap-3">
										{#each vacancy.duties as duty (duty)}
											<li class="flex items-start gap-3">
												<div
													class="mt-0.5 flex size-5 shrink-0 items-center justify-center rounded-full bg-accent-500/10"
												>
													<svg viewBox="0 0 12 12" class="size-2.5 fill-accent-500">
														<path
															d="M10.28 2.28L3.989 8.575 1.695 6.28A.751.751 0 00.633 7.345l2.83 2.83a.75.75 0 001.06 0l6.88-6.83a.751.751 0 00-1.123-1.065z"
														/>
													</svg>
												</div>
												<span class="text-sm leading-relaxed text-surface-300">{duty}</span>
											</li>
										{/each}
									</ul>
								</div>

								<!-- Requirements -->
								<div>
									<h4 class="mb-4 text-sm font-semibold tracking-wider text-surface-50 uppercase">
										Требования
									</h4>
									<ul class="flex flex-col gap-3">
										{#each vacancy.requirements as req (req)}
											<li class="flex items-start gap-3">
												<div
													class="mt-0.5 flex size-5 shrink-0 items-center justify-center rounded-full border border-accent-500/30"
												>
													<span class="size-1.5 rounded-full bg-accent-500"></span>
												</div>
												<span class="text-sm leading-relaxed text-surface-300">{req}</span>
											</li>
										{/each}
									</ul>
								</div>
							</div>

							<!-- Apply CTA -->
							<div
								class="mt-10 flex flex-col gap-4 rounded-2xl border border-accent-500/15 bg-accent-500/5 p-6 sm:flex-row sm:items-center sm:justify-between"
							>
								<div>
									<p class="font-semibold text-white">Хотите откликнуться?</p>
									<p class="mt-1 text-sm text-surface-300">
										Оставьте имя и телефон — мы свяжемся с вами в течение рабочего дня.
									</p>
								</div>
								<a
									href="#apply"
									class="inline-flex shrink-0 items-center gap-2 rounded-xl bg-accent-500 px-6 py-3 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-xl hover:shadow-accent-500/30"
								>
									Откликнуться
									<svg viewBox="0 0 20 20" class="size-4 fill-current">
										<path
											fill-rule="evenodd"
											d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
											clip-rule="evenodd"
										/>
									</svg>
								</a>
							</div>
						</div>
					{/if}
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== APPLY FORM ===== -->
<section id="apply" class="relative overflow-hidden py-24 lg:py-32">
	<!-- Background gradient -->
	<div
		class="absolute inset-0 bg-gradient-to-br from-accent-600/10 via-surface-900 to-surface-900"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.04]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 40px 40px;"
	></div>

	<div class="relative px-10 lg:px-24 xl:px-32">
		<div class="mx-auto max-w-2xl">
			<!-- Section header -->
			<div class="mb-12 text-center">
				<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
					Отклик на вакансию
				</span>
				<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
					Напишите <span class="text-surface-300">нам</span>
				</h2>
				<p class="mt-4 text-surface-300">
					Укажите имя и телефон — мы свяжемся с вами, обсудим детали и договоримся о встрече.
				</p>
			</div>

			<!-- Form card -->
			<div
				class="relative rounded-3xl border border-surface-700/50 bg-surface-800/50 p-8 shadow-2xl backdrop-blur-sm lg:p-10"
			>
				<!-- Accent decorations -->
				<div
					class="absolute -top-px right-12 h-px w-24 bg-gradient-to-r from-transparent via-accent-500 to-transparent"
				></div>
				<div
					class="absolute -bottom-px left-12 h-px w-24 bg-gradient-to-r from-transparent via-accent-500/50 to-transparent"
				></div>

				{#if submitted}
					<!-- Success state -->
					<div class="flex flex-col items-center py-8 text-center">
						<div
							class="mb-6 flex size-20 items-center justify-center rounded-full border border-accent-500/30 bg-accent-500/10"
						>
							<svg
								viewBox="0 0 24 24"
								class="size-10 fill-none stroke-accent-500 stroke-2"
								stroke-linecap="round"
								stroke-linejoin="round"
							>
								<path d="M20 6L9 17l-5-5" />
							</svg>
						</div>
						<h3 class="font-display text-2xl font-bold text-white">Отклик получен!</h3>
						<p class="mt-3 text-surface-300">
							Мы рассмотрим вашу кандидатуру и свяжемся с вами в течение
							<span class="font-semibold text-accent-500">1 рабочего дня</span>.
						</p>
						<button
							onclick={resetForm}
							class="mt-8 text-sm font-medium text-surface-300 transition-colors hover:text-surface-200"
						>
							← К вакансиям
						</button>
					</div>
				{:else}
					<!-- Form -->
					<form onsubmit={handleApply} class="flex flex-col gap-6">
						<!-- Name field -->
						<div class="flex flex-col gap-2">
							<label for="apply-name" class="text-sm font-medium text-surface-300">
								Ваше имя
							</label>
							<input
								id="apply-name"
								type="text"
								bind:value={formName}
								required
								placeholder="Как вас зовут?"
								class="w-full rounded-xl border border-surface-600 bg-surface-700/50 px-5 py-4 text-sm text-white placeholder-surface-300 transition-all duration-300 outline-none focus:border-accent-500/60 focus:bg-surface-700 focus:ring-2 focus:ring-accent-500/15"
							/>
						</div>

						<!-- Phone field -->
						<div class="flex flex-col gap-2">
							<label for="apply-phone" class="text-sm font-medium text-surface-300">
								Номер телефона
							</label>
							<input
								id="apply-phone"
								type="tel"
								bind:value={formPhone}
								required
								placeholder="+7 (___) ___-__-__"
								class="w-full rounded-xl border border-surface-600 bg-surface-700/50 px-5 py-4 text-sm text-white placeholder-surface-300 transition-all duration-300 outline-none focus:border-accent-500/60 focus:bg-surface-700 focus:ring-2 focus:ring-accent-500/15"
							/>
						</div>

						<!-- Privacy note -->
						<p class="text-xs leading-relaxed text-surface-300">
							Нажимая кнопку, вы соглашаетесь с
							<a
								href="/privacy"
								class="text-surface-300 underline underline-offset-2 transition-colors hover:text-accent-500"
								>политикой конфиденциальности</a
							>. Ваши данные не передаются третьим лицам.
						</p>

						<!-- Submit button -->
						<button
							type="submit"
							disabled={loading}
							class="group relative overflow-hidden rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30 disabled:cursor-not-allowed disabled:opacity-70"
						>
							{#if loading}
								<span class="flex items-center justify-center gap-3">
									<svg
										viewBox="0 0 24 24"
										class="size-4 animate-spin fill-none stroke-current stroke-2"
									>
										<circle cx="12" cy="12" r="10" stroke-opacity="0.3" />
										<path d="M12 2a10 10 0 0110 10" stroke-linecap="round" />
									</svg>
									Отправляем...
								</span>
							{:else}
								Отправить отклик
							{/if}
						</button>
					</form>
				{/if}
			</div>

			<!-- Trust badges -->
			<div class="mt-8 flex flex-wrap items-center justify-center gap-6">
				{#each [{ icon: '🔒', text: 'Данные защищены' }, { icon: '⚡', text: 'Ответим за 1 день' }, { icon: '🤝', text: 'Официальное трудоустройство' }] as badge (badge.text)}
					<div class="flex items-center gap-2 text-sm text-surface-300">
						<span>{badge.icon}</span>
						<span>{badge.text}</span>
					</div>
				{/each}
			</div>
		</div>
	</div>
</section>
