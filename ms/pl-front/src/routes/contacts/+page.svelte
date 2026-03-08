<script>
	let name = $state('');
	let phone = $state('');
	let submitted = $state(false);
	let loading = $state(false);

	const salons = [
		{
			name: 'PLITKA на Арбате',
			address: 'г. Москва, ул. Новый Арбат, 24',
			hours: 'Пн–Вс: 10:00 – 20:00',
			metro: 'м. Арбатская',
			phone: '+7 (495) 123-45-67'
		},
		{
			name: 'PLITKA на Маяковской',
			address: 'г. Москва, ул. 1-я Тверская-Ямская, 10',
			hours: 'Пн–Вс: 10:00 – 20:00',
			metro: 'м. Маяковская',
			phone: '+7 (495) 234-56-78'
		},
		{
			name: 'PLITKA в Мытищах',
			address: 'г. Мытищи, ш. Ярославское, 116',
			hours: 'Пн–Сб: 09:00 – 19:00',
			metro: 'ж/д Мытищи',
			phone: '+7 (498) 345-67-89'
		},
		{
			name: 'PLITKA в Красногорске',
			address: 'г. Красногорск, ул. Ленина, 52',
			hours: 'Пн–Сб: 09:00 – 19:00',
			metro: 'м. Митино (авт.)',
			phone: '+7 (495) 456-78-90'
		}
	];

	async function handleSubmit(e) {
		e.preventDefault();
		loading = true;
		await new Promise((r) => setTimeout(r, 1200));
		loading = false;
		submitted = true;
	}

	function resetForm() {
		name = '';
		phone = '';
		submitted = false;
	}
</script>

<svelte:head>
	<title>PLITKA — Контакты</title>
	<meta
		name="description"
		content="Свяжитесь с PLITKA: адреса партнёрских салонов, выезд курьера с образцами, получите промокод на скидку 10%."
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
	<div class="absolute top-1/2 left-1/4 -translate-x-1/2 -translate-y-1/2">
		<div class="size-[500px] rounded-full bg-accent-500/8 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-accent-500/20 bg-accent-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-accent-500"></span>
			<span class="text-xs font-semibold tracking-wider text-accent-500 uppercase"
				>Связаться с нами</span
			>
		</div>
		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			Контакты
		</h1>
		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Посетите наши партнёрские салоны, закажите образцы с доставкой или оставьте заявку — и
			получите <span class="font-semibold text-accent-500">скидку 10%</span>.
		</p>
	</div>
</section>

<!-- ===== SALONS SECTION ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Header -->
		<div class="mb-16">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
				Партнёрские салоны
			</span>
			<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
				Посмотрите образцы <span class="text-surface-300">вживую</span>
			</h2>
			<p class="mt-4 max-w-2xl text-surface-300">
				В наших партнёрских салонах представлены сотни коллекций — вы можете оценить фактуру, цвет и
				качество плитки перед покупкой. Консультанты помогут с выбором.
			</p>
		</div>

		<!-- Salon cards grid -->
		<div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
			{#each salons as salon (salon.name)}
				<div
					class="group rounded-2xl border border-surface-700/50 bg-surface-800/40 p-7 transition-all duration-500 hover:border-accent-500/30 hover:bg-surface-800/70 hover:shadow-2xl hover:shadow-accent-500/5"
				>
					<!-- Icon -->
					<div
						class="mb-5 flex size-12 items-center justify-center rounded-xl border border-accent-500/20 bg-accent-500/10 transition-all duration-300 group-hover:border-accent-500/50 group-hover:bg-accent-500/15"
					>
						<svg
							viewBox="0 0 24 24"
							class="size-5 fill-none stroke-accent-500 stroke-2"
							stroke-linecap="round"
							stroke-linejoin="round"
						>
							<path d="M12 21c-4.97-5.08-8-8.46-8-11a8 8 0 0116 0c0 2.54-3.03 5.92-8 11z" />
							<circle cx="12" cy="10" r="2.5" />
						</svg>
					</div>
					<h3 class="text-base font-bold text-white">{salon.name}</h3>
					<div class="mt-4 flex flex-col gap-2.5">
						<!-- Metro -->
						<div class="flex items-start gap-2">
							<span class="mt-0.5 shrink-0 text-accent-500">
								<svg viewBox="0 0 16 16" class="size-3.5 fill-current">
									<path
										fill-rule="evenodd"
										d="M8 15A7 7 0 108 1a7 7 0 000 14zm0 1A8 8 0 108 0a8 8 0 000 16z"
										clip-rule="evenodd"
									/>
									<path
										d="M5.5 5.5l1.5 3.5 1-2 1 2 1.5-3.5"
										fill="none"
										stroke="currentColor"
										stroke-width="1.2"
										stroke-linecap="round"
										stroke-linejoin="round"
									/>
								</svg>
							</span>
							<span class="text-sm text-surface-300">{salon.metro}</span>
						</div>
						<!-- Address -->
						<div class="flex items-start gap-2">
							<span class="mt-0.5 shrink-0 text-accent-500">
								<svg viewBox="0 0 16 16" class="size-3.5 fill-current">
									<path
										fill-rule="evenodd"
										d="M8 1a4.5 4.5 0 100 9 4.5 4.5 0 000-9zM2.5 5.5a5.5 5.5 0 1111 0 5.5 5.5 0 01-11 0zm4.95 5.854a6.5 6.5 0 013.1 0A8.001 8.001 0 0115 15H1a8.001 8.001 0 014.45-3.646z"
										clip-rule="evenodd"
									/>
								</svg>
							</span>
							<span class="text-sm text-surface-300">{salon.address}</span>
						</div>
						<!-- Hours -->
						<div class="flex items-center gap-2">
							<span class="shrink-0 text-accent-500">
								<svg viewBox="0 0 16 16" class="size-3.5 fill-current">
									<path
										fill-rule="evenodd"
										d="M1 8a7 7 0 1114 0A7 7 0 011 8zm7.75-4.25a.75.75 0 00-1.5 0V8c0 .414.336.75.75.75h3.25a.75.75 0 000-1.5h-2.5V3.75z"
										clip-rule="evenodd"
									/>
								</svg>
							</span>
							<span class="text-sm text-surface-300">{salon.hours}</span>
						</div>
					</div>
					<a
						href="tel:{salon.phone.replace(/\D/g, '')}"
						class="mt-6 flex items-center gap-2 text-sm font-semibold text-accent-500 transition-colors hover:text-accent-400"
					>
						<svg viewBox="0 0 16 16" class="size-4 fill-current">
							<path
								fill-rule="evenodd"
								d="M3.5 2A1.5 1.5 0 002 3.5V5c0 5.247 4.253 9.5 9.5 9.5H13a1.5 1.5 0 001.5-1.5v-1.277a.75.75 0 00-.471-.696l-2.783-1.113a.75.75 0 00-.867.26l-.697 1.016a.75.75 0 01-.847.243A9.01 9.01 0 016.04 8.125a.75.75 0 01.243-.847l1.016-.697a.75.75 0 00.26-.867L6.446 2.931A.75.75 0 005.75 2.46 2.404 2.404 0 005.5 2h-2z"
								clip-rule="evenodd"
							/>
						</svg>
						{salon.phone}
					</a>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== COURIER SECTION ===== -->
<section class="relative overflow-hidden bg-surface-800/30 py-24 lg:py-32">
	<!-- Accent glow -->
	<div class="absolute top-1/2 right-0 translate-x-1/3 -translate-y-1/2">
		<div class="size-[500px] rounded-full bg-accent-500/5 blur-3xl"></div>
	</div>

	<div class="relative px-10 lg:px-24 xl:px-32">
		<div class="grid items-center gap-12 lg:grid-cols-2 lg:gap-16">
			<!-- Left: content -->
			<div>
				<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
					Курьер с образцами
				</span>
				<h2
					class="mt-4 font-display text-4xl leading-tight font-bold tracking-wide text-white lg:text-5xl"
				>
					Образцы привезём <span class="text-surface-300">к вам</span>
				</h2>
				<p class="mt-6 text-lg leading-relaxed text-surface-300">
					Не можете приехать в салон? Наш курьер доставит образцы понравившихся коллекций прямо к
					вам домой или в офис. Бесплатно, в удобное время.
				</p>
				<ul class="mt-8 flex flex-col gap-4">
					{#each ['Доставка в день обращения (по Москве)', 'До 10 образцов в одной доставке', 'Консультация по телефону во время выбора', 'Без залога и предоплаты'] as feature (feature)}
						<li class="flex items-center gap-3">
							<div
								class="flex size-6 shrink-0 items-center justify-center rounded-full bg-accent-500/10"
							>
								<svg viewBox="0 0 12 12" class="size-3 fill-accent-500">
									<path
										d="M10.28 2.28L3.989 8.575 1.695 6.28A.751.751 0 00.633 7.345l2.83 2.83a.75.75 0 001.06 0l6.88-6.83a.751.751 0 00-1.123-1.065z"
									/>
								</svg>
							</div>
							<span class="text-sm text-surface-200">{feature}</span>
						</li>
					{/each}
				</ul>
				<a
					href="tel:+78001234567"
					class="mt-10 inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
				>
					Заказать доставку образцов
					<svg viewBox="0 0 20 20" class="size-4 fill-current">
						<path
							fill-rule="evenodd"
							d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
							clip-rule="evenodd"
						/>
					</svg>
				</a>
			</div>

			<!-- Right: step cards -->
			<div class="relative flex flex-col gap-4">
				{#each [{ step: '01', title: 'Позвоните или напишите', desc: 'Сообщите, какие коллекции вас интересуют — мы подберём образцы' }, { step: '02', title: 'Согласуйте время', desc: 'Выберите удобный день и временной слот для доставки' }, { step: '03', title: 'Получите образцы', desc: 'Курьер привезёт образцы прямо к вашей двери — выбирайте не спеша' }] as item (item.step)}
					<div
						class="flex items-start gap-5 rounded-2xl border border-surface-700/50 bg-surface-800/60 p-6 backdrop-blur-sm transition-all duration-300 hover:border-accent-500/20"
					>
						<span class="font-display text-3xl font-bold text-accent-500/30">{item.step}</span>
						<div>
							<h4 class="font-semibold text-white">{item.title}</h4>
							<p class="mt-1 text-sm leading-relaxed text-surface-300">{item.desc}</p>
						</div>
					</div>
				{/each}
			</div>
		</div>
	</div>
</section>

<!-- ===== PROMO FORM SECTION ===== -->
<section class="relative overflow-hidden py-24 lg:py-32">
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
					Специальное предложение
				</span>
				<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
					Скидка <span
						class="bg-gradient-to-r from-accent-500 to-accent-300 bg-clip-text text-transparent"
						>10%</span
					>
				</h2>
				<p class="mt-4 text-surface-300">
					Оставьте имя и номер телефона — мы пришлём промокод в WhatsApp или Telegram. Без спама,
					только актуальные предложения.
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
						<h3 class="font-display text-2xl font-bold text-white">Промокод отправлен!</h3>
						<p class="mt-3 text-surface-300">
							Мы отправили вам промокод <span class="font-semibold text-accent-500">PLITKA10</span>
							— используйте его при оформлении заказа.
						</p>
						<button
							onclick={resetForm}
							class="mt-8 text-sm font-medium text-surface-300 transition-colors hover:text-surface-200"
						>
							← Вернуться
						</button>
					</div>
				{:else}
					<!-- Form -->
					<form onsubmit={handleSubmit} class="flex flex-col gap-6">
						<!-- Name field -->
						<div class="flex flex-col gap-2">
							<label for="contact-name" class="text-sm font-medium text-surface-300">
								Ваше имя
							</label>
							<input
								id="contact-name"
								type="text"
								bind:value={name}
								required
								placeholder="Как вас зовут?"
								class="w-full rounded-xl border border-surface-600 bg-surface-700/50 px-5 py-4 text-sm text-white placeholder-surface-300 transition-all duration-300 outline-none focus:border-accent-500/60 focus:bg-surface-700 focus:ring-2 focus:ring-accent-500/15"
							/>
						</div>

						<!-- Phone field -->
						<div class="flex flex-col gap-2">
							<label for="contact-phone" class="text-sm font-medium text-surface-300">
								Номер телефона
							</label>
							<input
								id="contact-phone"
								type="tel"
								bind:value={phone}
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
								Получить промокод на 10%
							{/if}
						</button>
					</form>
				{/if}
			</div>

			<!-- Trust badges -->
			<div class="mt-8 flex flex-wrap items-center justify-center gap-6">
				{#each [{ icon: '🔒', text: 'Данные защищены' }, { icon: '🚫', text: 'Без спама' }, { icon: '⚡', text: 'Промокод за 5 минут' }] as badge (badge.text)}
					<div class="flex items-center gap-2 text-sm text-surface-300">
						<span>{badge.icon}</span>
						<span>{badge.text}</span>
					</div>
				{/each}
			</div>
		</div>
	</div>
</section>
