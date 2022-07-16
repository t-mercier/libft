/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_atoi.c                                          :+:    :+:            */
/*                                                     +:+                    */
/*   By: timotheemercier <timotheemercier@student...  +#+                     */
/*                                                   +#+                      */
/*   Created: 2022/07/07 17:18:19 by timotheemer...#+#    #+#                 */
/*   Updated: 2022/07/07 17:18:19 by timotheemer...########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <limits.h>

long	ft_atoi(const char *str)
{
	int	sign;
	long	res;

	sign = 1;
	res = 0;
	while (!ft_isdigit(*str) && res++ < 1)
		str++;
	if (*(str - 1) == 0x2d)
		sign = -1;
	res = 0;
	while (ft_isdigit(*str))
	{
		res = res * 10 + (*str - 0x30);
		str++;
	}
}
