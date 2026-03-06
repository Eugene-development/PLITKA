<script>
	let scrolled = $state(false);
	let mobileMenuOpen = $state(false);

	const navLinks = [
		{ label: 'Коллекции', href: '/collections' },
		{ label: 'Бренды', href: '/brands' },
		{ label: 'Услуги', href: '/services' },
		{ label: 'О нас', href: '/about' },
		{ label: 'Контакты', href: '/contacts' }
	];

	function handleScroll() {
		scrolled = window.scrollY > 50;
	}

	function toggleMenu() {
		mobileMenuOpen = !mobileMenuOpen;
	}
</script>

<svelte:window onscroll={handleScroll} />

<header
	class="fixed top-0 left-0 z-50 w-full transition-all duration-500 ease-out {scrolled
		? 'bg-surface-900/95 py-3 shadow-2xl shadow-black/50 backdrop-blur-xl'
		: 'bg-transparent py-6'}"
>
	<div class="flex items-center justify-between px-10 lg:px-24 xl:px-32">
		<!-- Logo -->
		<a href="/" class="group flex items-center gap-3">
			<div
				class="flex size-10 items-center justify-center rounded-lg border border-accent-500/30 bg-accent-500/10 transition-all duration-300 group-hover:border-accent-500 group-hover:bg-accent-500/20"
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
				<span
					class="font-display text-xl font-bold tracking-wider text-surface-50 uppercase transition-colors group-hover:text-accent-500"
				>
					PLITKA
				</span>
				<span
					class="block text-[10px] font-medium tracking-[0.3em] text-surface-300 uppercase transition-colors group-hover:text-surface-300"
				>
					Керамика & Дизайн
				</span>
			</div>
		</a>

		<!-- Desktop Nav -->
		<nav class="hidden items-center gap-1 lg:flex">
			{#each navLinks as link (link.href)}
				<a
					href={link.href}
					class="group relative px-4 py-2 text-sm font-medium tracking-wide text-surface-300 transition-colors hover:text-surface-50"
				>
					{link.label}
					<span
						class="absolute bottom-0 left-1/2 h-px w-0 -translate-x-1/2 bg-accent-500 transition-all duration-300 group-hover:w-3/4"
					></span>
				</a>
			{/each}
		</nav>

		<!-- Right side actions -->
		<div class="hidden items-center gap-4 lg:flex">
			<a
				href="tel:+78001234567"
				class="group flex items-center gap-2 rounded-lg border border-surface-600/50 bg-surface-800/40 px-4 py-2 text-sm font-medium tracking-wide text-surface-200 backdrop-blur-sm transition-all duration-300 hover:border-accent-500/50 hover:bg-surface-800/60 hover:text-white"
			>
				<svg
					viewBox="0 0 24 24"
					class="size-4 fill-none stroke-current stroke-2 transition-transform duration-300 group-hover:scale-110"
					stroke-linecap="round"
					stroke-linejoin="round"
				>
					<path
						d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"
					/>
				</svg>
				8 (915) 400-00-20
			</a>
			<!-- Compare icon -->
			<a
				href="/compare"
				aria-label="Сравнение"
				class="group flex size-9 items-center justify-center rounded-lg border border-surface-600 bg-surface-800/60 text-surface-300 transition-all duration-300 hover:border-sky-500/40 hover:bg-sky-500/5 hover:text-sky-400"
			>
				<svg
					viewBox="0 0 24 24"
					class="size-4 fill-none stroke-current stroke-2"
					stroke-linecap="round"
					stroke-linejoin="round"
				>
					<rect x="3" y="3" width="7" height="18" rx="1" />
					<rect x="14" y="3" width="7" height="18" rx="1" />
					<path d="M8 7h8M8 12h8M8 17h8" stroke-linecap="round" />
				</svg>
			</a>
			<!-- Favorites icon -->
			<a
				href="/favorites"
				aria-label="Избранное"
				class="group flex size-9 items-center justify-center rounded-lg border border-surface-600 bg-surface-800/60 text-surface-300 transition-all duration-300 hover:border-rose-500/40 hover:bg-rose-500/5 hover:text-rose-400"
			>
				<svg
					viewBox="0 0 24 24"
					class="size-4 fill-none stroke-current stroke-2"
					stroke-linecap="round"
					stroke-linejoin="round"
				>
					<path
						d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"
					/>
				</svg>
			</a>
		</div>

		<!-- Mobile burger -->
		<button
			onclick={toggleMenu}
			class="relative z-50 flex size-10 cursor-pointer flex-col items-center justify-center gap-1.5 border-none bg-transparent lg:hidden"
			aria-label="Меню"
		>
			<span
				class="block h-0.5 w-6 bg-surface-100 transition-all duration-300 {mobileMenuOpen
					? 'translate-y-2 rotate-45'
					: ''}"
			></span>
			<span
				class="block h-0.5 w-6 bg-surface-100 transition-all duration-300 {mobileMenuOpen
					? 'scale-x-0 opacity-0'
					: ''}"
			></span>
			<span
				class="block h-0.5 w-6 bg-surface-100 transition-all duration-300 {mobileMenuOpen
					? '-translate-y-2 -rotate-45'
					: ''}"
			></span>
		</button>
	</div>

	<!-- Mobile Menu Overlay -->
	{#if mobileMenuOpen}
		<div
			class="fixed inset-0 z-40 flex flex-col items-center justify-center gap-8 bg-surface-900/98 backdrop-blur-2xl lg:hidden"
		>
			{#each navLinks as link (link.href)}
				<a
					href={link.href}
					onclick={toggleMenu}
					class="font-display text-3xl font-bold tracking-wide text-surface-200 transition-colors hover:text-accent-500"
				>
					{link.label}
				</a>
			{/each}
			<a
				href="/compare"
				onclick={toggleMenu}
				class="font-display text-3xl font-bold tracking-wide text-surface-200 transition-colors hover:text-sky-400"
			>
				⬚ Сравнение
			</a>
			<a
				href="/favorites"
				onclick={toggleMenu}
				class="font-display text-3xl font-bold tracking-wide text-surface-200 transition-colors hover:text-rose-400"
			>
				♡ Избранное
			</a>
			<a
				href="tel:+78001234567"
				class="mt-4 flex items-center gap-3 rounded-xl border border-surface-700/50 bg-black/20 px-6 py-3 text-lg font-medium text-surface-100 backdrop-blur-xl transition-all hover:bg-black/30 hover:text-accent-400"
			>
				<svg
					viewBox="0 0 24 24"
					class="size-5 fill-none stroke-accent-500 stroke-2"
					stroke-linecap="round"
					stroke-linejoin="round"
				>
					<path
						d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"
					/>
				</svg>
				8 (800) 123-45-67
			</a>
		</div>
	{/if}
</header>
