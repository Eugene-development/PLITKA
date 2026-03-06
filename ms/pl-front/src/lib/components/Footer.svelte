<script>
	const currentYear = new Date().getFullYear();

	const footerSections = [
		{
			title: 'Каталог',
			links: [
				{ label: 'Настенная плитка', href: '/catalog/wall' },
				{ label: 'Напольная плитка', href: '/catalog/floor' },
				{ label: 'Керамогранит', href: '/catalog/porcelain' },
				{ label: 'Мозаика', href: '/catalog/mosaic' },
				{ label: 'Декоры', href: '/catalog/decor' }
			]
		},
		{
			title: 'Коллекции',
			links: [
				{ label: 'Новинки 2026', href: '/collections/new' },
				{ label: 'Мрамор', href: '/collections/marble' },
				{ label: 'Минимализм', href: '/collections/minimal' },
				{ label: 'Арт-деко', href: '/collections/art-deco' },
				{ label: 'Лофт', href: '/collections/loft' }
			]
		},
		{
			title: 'Компания',
			links: [
				{ label: 'О нас', href: '/about' },
				{ label: 'Контакты', href: '/contacts' },
				{ label: 'Дизайнерам', href: '/designers' },
				{ label: 'Доставка', href: '/delivery' },
				{ label: 'Вакансии', href: '/vacancies' }
			]
		}
	];

	const socials = [
		{ label: 'Telegram', icon: 'tg', href: '#' },
		{ label: 'VK', icon: 'vk', href: '#' },
		{ label: 'WhatsApp', icon: 'wa', href: '#' }
	];
</script>

<footer class="relative border-t border-surface-700/50 bg-surface-900">
	<!-- Gradient divider line -->
	<div
		class="absolute top-0 right-0 left-0 h-px bg-gradient-to-r from-transparent via-accent-500/50 to-transparent"
	></div>

	<div class="px-10 pt-16 pb-8 lg:px-24 xl:px-32">
		<div class="grid grid-cols-1 gap-12 md:grid-cols-2 lg:grid-cols-5">
			<!-- Brand column -->
			<div class="lg:col-span-2">
				<a href="/" class="group inline-flex items-center gap-3">
					<div
						class="flex size-10 items-center justify-center rounded-lg border border-accent-500/30 bg-accent-500/10 transition-all duration-300 group-hover:border-accent-500"
					>
						<svg
							viewBox="0 0 24 24"
							class="size-5 fill-none stroke-accent-500 stroke-2"
							stroke-linecap="round"
							stroke-linejoin="round"
						>
							<rect x="3" y="3" width="8" height="8" rx="1" />
							<rect x="13" y="3" width="8" height="8" rx="1" />
							<rect x="3" y="13" width="8" height="8" rx="1" />
							<rect x="13" y="13" width="8" height="8" rx="1" />
						</svg>
					</div>
					<div>
						<span class="font-display text-xl font-bold tracking-wider text-surface-50 uppercase">
							PLITKA
						</span>
						<span class="block text-[10px] font-medium tracking-[0.3em] text-surface-300 uppercase">
							Керамика & Дизайн
						</span>
					</div>
				</a>
				<p class="mt-6 max-w-sm text-sm leading-relaxed text-surface-300">
					Качественная керамическая плитка для вашего интерьера. Широкий ассортимент коллекций от
					ведущих мировых и российских производителей.
				</p>
				<div class="mt-8 flex items-center gap-4">
					{#each socials as social (social.label)}
						<a
							href={social.href}
							aria-label={social.label}
							class="flex size-10 items-center justify-center rounded-lg border border-surface-600 bg-surface-800 text-sm font-bold text-surface-300 transition-all duration-300 hover:border-accent-500/40 hover:bg-surface-700 hover:text-accent-500"
						>
							{social.icon.toUpperCase()}
						</a>
					{/each}
				</div>
			</div>

			<!-- Link columns -->
			{#each footerSections as section (section.title)}
				<div>
					<h4 class="mb-5 text-sm font-semibold tracking-wider text-surface-50 uppercase">
						{section.title}
					</h4>
					<ul class="flex flex-col gap-3">
						{#each section.links as link (link.href)}
							<li>
								<a
									href={link.href}
									class="text-sm text-surface-300 transition-colors duration-200 hover:text-accent-500"
								>
									{link.label}
								</a>
							</li>
						{/each}
					</ul>
				</div>
			{/each}
		</div>

		<!-- Bottom bar -->
		<div
			class="mt-16 flex flex-col items-center justify-between gap-4 border-t border-surface-700/50 pt-8 md:flex-row"
		>
			<p class="text-xs text-surface-300">
				© {currentYear} PLITKA. Все права защищены.
			</p>
			<div class="flex gap-6">
				<a
					href="/privacy"
					class="text-xs text-surface-300 transition-colors hover:text-surface-300"
				>
					Политика конфиденциальности
				</a>
				<a href="/terms" class="text-xs text-surface-300 transition-colors hover:text-surface-300">
					Пользовательское соглашение
				</a>
			</div>
		</div>
	</div>
</footer>
