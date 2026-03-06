<svelte:head>
	<title>Услуги — PLITKA</title>
	<meta
		name="description"
		content="Полный спектр услуг PLITKA: доставка, укладка плитки, сантехнические работы, дизайн интерьера и подбор мебели для вашего проекта."
	/>
</svelte:head>

<!-- ===== HERO ===== -->
<section class="relative flex min-h-[48vh] items-center overflow-hidden">
	<div
		class="absolute inset-0 bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>
	<div class="absolute top-1/2 right-1/4 -translate-x-1/2 -translate-y-1/2">
		<div class="size-[600px] rounded-full bg-accent-500/5 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-accent-500/20 bg-accent-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-accent-500"></span>
			<span class="text-xs font-semibold tracking-wider text-accent-500 uppercase"
				>Для вашего проекта</span
			>
		</div>
		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			Услуги
		</h1>
		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Берём на себя все этапы — от доставки материалов до реализации дизайн-проекта «под ключ».
			Работаем профессионально и в срок.
		</p>
	</div>
</section>

<!-- ===== SERVICES GRID ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<div class="grid grid-cols-1 gap-8 md:grid-cols-2 xl:grid-cols-3">
			<!-- Доставка -->
			<div
				class="group relative flex flex-col rounded-2xl border border-surface-700/50 bg-surface-800/40 p-8 transition-all duration-500 hover:border-accent-500/30 hover:bg-surface-800/70 hover:shadow-2xl hover:shadow-accent-500/5"
			>
				<div
					class="mb-6 flex size-14 items-center justify-center rounded-xl border border-accent-500/20 bg-accent-500/10 transition-all duration-300 group-hover:border-accent-500/40 group-hover:bg-accent-500/15"
				>
					<svg
						viewBox="0 0 24 24"
						class="size-7 fill-none stroke-accent-500 stroke-[1.5]"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<path d="M5 17H3a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v3" />
						<rect x="9" y="11" width="14" height="10" rx="2" />
						<circle cx="12" cy="21" r="1" />
						<circle cx="20" cy="21" r="1" />
					</svg>
				</div>

				<h2
					class="font-display text-2xl font-bold text-white transition-colors duration-300 group-hover:text-accent-500"
				>
					Доставка
				</h2>
				<p class="mt-4 flex-1 text-base leading-relaxed text-surface-400">
					Быстрая и бережная доставка плитки, сантехники и отделочных материалов прямо на объект.
					Работаем по городу и области, обеспечиваем сохранность груза.
				</p>

				<ul class="mt-6 space-y-2.5">
					{#each ['Доставка в день заказа', 'Аккуратная погрузка и разгрузка', 'Отслеживание заказа в реальном времени'] as item}
						<li class="flex items-center gap-3 text-sm text-surface-400">
							<span
								class="flex size-5 shrink-0 items-center justify-center rounded-full bg-accent-500/15"
							>
								<svg viewBox="0 0 12 12" class="size-3 fill-accent-500">
									<path
										fill-rule="evenodd"
										d="M9.854 3.146a.5.5 0 010 .708l-5 5a.5.5 0 01-.708 0l-2-2a.5.5 0 01.708-.708L4.5 7.793l4.646-4.647a.5.5 0 01.708 0z"
										clip-rule="evenodd"
									/>
								</svg>
							</span>
							{item}
						</li>
					{/each}
				</ul>

				<div class="mt-8 flex items-center justify-between border-t border-surface-700/50 pt-6">
					<a
						href="/contacts"
						class="text-sm font-semibold text-accent-500 transition-colors hover:text-accent-400"
					>
						Заказать доставку →
					</a>
				</div>
			</div>

			<!-- Плиточник -->
			<div
				class="group relative flex flex-col rounded-2xl border border-surface-700/50 bg-surface-800/40 p-8 transition-all duration-500 hover:border-accent-500/30 hover:bg-surface-800/70 hover:shadow-2xl hover:shadow-accent-500/5"
			>
				<div
					class="mb-6 flex size-14 items-center justify-center rounded-xl border border-accent-500/20 bg-accent-500/10 transition-all duration-300 group-hover:border-accent-500/40 group-hover:bg-accent-500/15"
				>
					<svg
						viewBox="0 0 24 24"
						class="size-7 fill-none stroke-accent-500 stroke-[1.5]"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<rect x="3" y="3" width="8" height="8" rx="1" />
						<rect x="13" y="3" width="8" height="8" rx="1" />
						<rect x="3" y="13" width="8" height="8" rx="1" />
						<rect x="13" y="13" width="8" height="8" rx="1" />
					</svg>
				</div>

				<h2
					class="font-display text-2xl font-bold text-white transition-colors duration-300 group-hover:text-accent-500"
				>
					Плиточник
				</h2>
				<p class="mt-4 flex-1 text-base leading-relaxed text-surface-400">
					Профессиональная укладка керамической плитки, керамогранита и мозаики. Опытные мастера с
					портфолио готовых объектов — ванные, кухни, прихожие, фасады.
				</p>

				<ul class="mt-6 space-y-2.5">
					{#each ['Укладка любого формата и сложности', 'Точная подрезка и стыковка', 'Гарантия на работы 2 года'] as item}
						<li class="flex items-center gap-3 text-sm text-surface-400">
							<span
								class="flex size-5 shrink-0 items-center justify-center rounded-full bg-accent-500/15"
							>
								<svg viewBox="0 0 12 12" class="size-3 fill-accent-500">
									<path
										fill-rule="evenodd"
										d="M9.854 3.146a.5.5 0 010 .708l-5 5a.5.5 0 01-.708 0l-2-2a.5.5 0 01.708-.708L4.5 7.793l4.646-4.647a.5.5 0 01.708 0z"
										clip-rule="evenodd"
									/>
								</svg>
							</span>
							{item}
						</li>
					{/each}
				</ul>

				<div class="mt-8 flex items-center justify-between border-t border-surface-700/50 pt-6">
					<a
						href="/contacts"
						class="text-sm font-semibold text-accent-500 transition-colors hover:text-accent-400"
					>
						Вызвать мастера →
					</a>
				</div>
			</div>

			<!-- Сантехник -->
			<div
				class="group relative flex flex-col rounded-2xl border border-surface-700/50 bg-surface-800/40 p-8 transition-all duration-500 hover:border-accent-500/30 hover:bg-surface-800/70 hover:shadow-2xl hover:shadow-accent-500/5"
			>
				<div
					class="mb-6 flex size-14 items-center justify-center rounded-xl border border-accent-500/20 bg-accent-500/10 transition-all duration-300 group-hover:border-accent-500/40 group-hover:bg-accent-500/15"
				>
					<svg
						viewBox="0 0 24 24"
						class="size-7 fill-none stroke-accent-500 stroke-[1.5]"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<path d="M12 22v-5" />
						<path d="M9 8V2" />
						<path d="M15 8V2" />
						<path d="M18 8H2a6 6 0 0 0 6 6h1v4" />
					</svg>
				</div>

				<h2
					class="font-display text-2xl font-bold text-white transition-colors duration-300 group-hover:text-accent-500"
				>
					Сантехник
				</h2>
				<p class="mt-4 flex-1 text-base leading-relaxed text-surface-400">
					Монтаж и подключение сантехники: ванны, душевые кабины, унитазы, раковины, смесители.
					Качественные работы с соблюдением всех норм и стандартов.
				</p>

				<ul class="mt-6 space-y-2.5">
					{#each ['Монтаж под ключ', 'Замена старых трубопроводов', 'Выезд в день обращения'] as item}
						<li class="flex items-center gap-3 text-sm text-surface-400">
							<span
								class="flex size-5 shrink-0 items-center justify-center rounded-full bg-accent-500/15"
							>
								<svg viewBox="0 0 12 12" class="size-3 fill-accent-500">
									<path
										fill-rule="evenodd"
										d="M9.854 3.146a.5.5 0 010 .708l-5 5a.5.5 0 01-.708 0l-2-2a.5.5 0 01.708-.708L4.5 7.793l4.646-4.647a.5.5 0 01.708 0z"
										clip-rule="evenodd"
									/>
								</svg>
							</span>
							{item}
						</li>
					{/each}
				</ul>

				<div class="mt-8 flex items-center justify-between border-t border-surface-700/50 pt-6">
					<a
						href="/contacts"
						class="text-sm font-semibold text-accent-500 transition-colors hover:text-accent-400"
					>
						Вызвать сантехника →
					</a>
				</div>
			</div>

			<!-- Дизайн интерьера -->
			<div
				class="group relative flex flex-col rounded-2xl border border-surface-700/50 bg-surface-800/40 p-8 transition-all duration-500 hover:border-accent-500/30 hover:bg-surface-800/70 hover:shadow-2xl hover:shadow-accent-500/5 md:col-span-1"
			>
				<div
					class="mb-6 flex size-14 items-center justify-center rounded-xl border border-accent-500/20 bg-accent-500/10 transition-all duration-300 group-hover:border-accent-500/40 group-hover:bg-accent-500/15"
				>
					<svg
						viewBox="0 0 24 24"
						class="size-7 fill-none stroke-accent-500 stroke-[1.5]"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<path d="M2 13.5V20a1 1 0 0 0 1 1h18a1 1 0 0 0 1-1v-6.5" />
						<path d="M2 13.5A2.5 2.5 0 0 1 4.5 11h15a2.5 2.5 0 0 1 2.5 2.5" />
						<path d="M8 11V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v6" />
						<path d="M12 11V3" />
					</svg>
				</div>

				<h2
					class="font-display text-2xl font-bold text-white transition-colors duration-300 group-hover:text-accent-500"
				>
					Дизайн интерьера
				</h2>
				<p class="mt-4 flex-1 text-base leading-relaxed text-surface-400">
					Разработка авторских дизайн-проектов: концепция, планировочное решение, подбор отделочных
					материалов, 3D-визуализация. Превращаем ваши идеи в законченный образ.
				</p>

				<ul class="mt-6 space-y-2.5">
					{#each ['3D-визуализация каждой комнаты', 'Подбор материалов под бюджет', 'Авторский надзор за ремонтом'] as item}
						<li class="flex items-center gap-3 text-sm text-surface-400">
							<span
								class="flex size-5 shrink-0 items-center justify-center rounded-full bg-accent-500/15"
							>
								<svg viewBox="0 0 12 12" class="size-3 fill-accent-500">
									<path
										fill-rule="evenodd"
										d="M9.854 3.146a.5.5 0 010 .708l-5 5a.5.5 0 01-.708 0l-2-2a.5.5 0 01.708-.708L4.5 7.793l4.646-4.647a.5.5 0 01.708 0z"
										clip-rule="evenodd"
									/>
								</svg>
							</span>
							{item}
						</li>
					{/each}
				</ul>

				<div class="mt-8 flex items-center justify-between border-t border-surface-700/50 pt-6">
					<a
						href="/contacts"
						class="text-sm font-semibold text-accent-500 transition-colors hover:text-accent-400"
					>
						Заказать проект →
					</a>
				</div>
			</div>

			<!-- Подбор мебели -->
			<div
				class="group relative flex flex-col rounded-2xl border border-surface-700/50 bg-surface-800/40 p-8 transition-all duration-500 hover:border-accent-500/30 hover:bg-surface-800/70 hover:shadow-2xl hover:shadow-accent-500/5"
			>
				<div
					class="mb-6 flex size-14 items-center justify-center rounded-xl border border-accent-500/20 bg-accent-500/10 transition-all duration-300 group-hover:border-accent-500/40 group-hover:bg-accent-500/15"
				>
					<svg
						viewBox="0 0 24 24"
						class="size-7 fill-none stroke-accent-500 stroke-[1.5]"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<path d="M20 9V6a2 2 0 0 0-2-2H6a2 2 0 0 0-2 2v3" />
						<path
							d="M2 11v5a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-5a2 2 0 0 0-4 0v2H6v-2a2 2 0 0 0-4 0Z"
						/>
						<path d="M4 18v2" />
						<path d="M20 18v2" />
						<path d="M12 4v9" />
					</svg>
				</div>

				<h2
					class="font-display text-2xl font-bold text-white transition-colors duration-300 group-hover:text-accent-500"
				>
					Подбор мебели
				</h2>
				<p class="mt-4 flex-1 text-base leading-relaxed text-surface-400">
					Помогаем выбрать мебель, которая гармонично впишется в интерьер: ванные комнаты, кухни,
					гостиные. Работаем с ведущими производителями по выгодным ценам.
				</p>

				<ul class="mt-6 space-y-2.5">
					{#each ['Подбор под дизайн-проект', 'Каталог сотен коллекций', 'Доставка и сборка включены'] as item}
						<li class="flex items-center gap-3 text-sm text-surface-400">
							<span
								class="flex size-5 shrink-0 items-center justify-center rounded-full bg-accent-500/15"
							>
								<svg viewBox="0 0 12 12" class="size-3 fill-accent-500">
									<path
										fill-rule="evenodd"
										d="M9.854 3.146a.5.5 0 010 .708l-5 5a.5.5 0 01-.708 0l-2-2a.5.5 0 01.708-.708L4.5 7.793l4.646-4.647a.5.5 0 01.708 0z"
										clip-rule="evenodd"
									/>
								</svg>
							</span>
							{item}
						</li>
					{/each}
				</ul>

				<div class="mt-8 flex items-center justify-between border-t border-surface-700/50 pt-6">
					<a
						href="/contacts"
						class="text-sm font-semibold text-accent-500 transition-colors hover:text-accent-400"
					>
						Подобрать мебель →
					</a>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- ===== CTA ===== -->
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
			Готовы обсудить ваш проект?
		</h2>
		<p class="mx-auto mt-6 max-w-xl text-lg text-surface-300">
			Свяжитесь с нами — бесплатно проконсультируем, рассчитаем стоимость и подберём оптимальное
			решение под ваши задачи.
		</p>
		<div class="mt-10 flex flex-wrap items-center justify-center gap-4">
			<a
				href="/contacts"
				class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
			>
				Связаться с нами
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
</section>
