/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_put_uint_format_bonus.c                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eujeong <eujeong@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/30 17:26:50 by eujeong           #+#    #+#             */
/*   Updated: 2022/09/02 19:19:29 by eujeong          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf_bonus.h"

int	ft_put_uint_format(t_format *format, t_uint unum)
{
	int	ret;
	int	unum_len;
	int	p_len;

	ret = 0;
	unum_len = ft_uint_len_prec(unum, format->prec);
	p_len = format->width - unum_len;
	if (!(format->flag & FLAG_MINUS) && p_len > 0)
		ret += ft_put_padding(p_len, (format->flag & FLAG_ZERO));
	ret += ft_putnbr_prec(unum, format->prec);
	if ((format->flag & FLAG_MINUS) && p_len > 0)
		ret += ft_put_padding(p_len, 0);
	return (ret);
}
