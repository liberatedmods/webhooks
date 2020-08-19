from dhooks import Webhook, Embed

hook = Webhook('https://discordapp.com/api/webhooks/745418127734734929/GOBbq6bhyfXpKg8NwgbSE2Yqcaa8XrDPvAAHx2PlGanuvDgWNZ9Uai546JIh1z_O7HCT')

embed = Embed(
        description='main text',
        color=#color,
        timestamp='now'
        )

embed.set_thumbnail('https://i.imgur.com/cWUElJr.png')
embed.set_footer(text="NeutronVPN @ruled")

hook.send(embed=embed)