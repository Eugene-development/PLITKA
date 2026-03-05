<script>
	let scrolled = $state(false);
	let mobileMenuOpen = $state(false);

	const navLinks = [
		{ label: 'Каталог', href: '/catalog' },
		{ label: 'Коллекции', href: '/collections' },
		{ label: 'Бренды', href: '/brands' },
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
					class="block text-[10px] font-medium tracking-[0.3em] text-surface-400 uppercase transition-colors group-hover:text-surface-300"
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
				class="text-sm font-medium tracking-wide text-surface-300 transition-colors hover:text-accent-500"
			>
				8 (800) 123-45-67
			</a>
			<!-- <a
				href="/catalog"
				class="rounded-lg border border-accent-500 bg-accent-500/10 px-6 py-2.5 text-sm font-semibold tracking-wide text-accent-500 transition-all duration-300 hover:bg-accent-500 hover:text-surface-900 hover:shadow-lg hover:shadow-accent-500/25"
			>
				Каталог
			</a> -->
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
			<a href="tel:+78001234567" class="mt-4 text-lg font-medium text-accent-500">
				8 (800) 123-45-67
			</a>
		</div>
	{/if}
</header>
